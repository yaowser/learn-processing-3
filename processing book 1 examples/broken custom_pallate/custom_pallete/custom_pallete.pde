/* Basic Drawing Application Example
Ira Greenberg, April 17, 2006 */
// fonts
PFont titleFont, clearFont;
// canvas background color
color canvasBg = color(255);
// paint color
color paintColor;
// palette
color[]palette = new color[156];
// create 3 icons
PImage pencil, brush, eraser;
// panels coordinate arrays
float[] menu, tools, canvas;
// buttons coordinate arrays
float[] pencilBtn, brushBtn, eraserBtn;
//create button state colors
color buttonUp = color(175, 175, 50, 150);
color buttonOver = color(255, 130, 20, 175);
color buttonSelected = color(250, 250, 30, 175);
// set initial button background colors
color pencilBg = buttonSelected;
color brushBg = buttonUp;
color eraserBg = buttonUp;
// button booleans
boolean isPencilSelected = true;
boolean isBrushSelected = false;
boolean isEraserSelected = false;
// slider
float[] sliderBar, sliderHandle;
boolean isSliderMovable = false;
color sliderHandleUp = color(255, 127, 0);
color sliderHandleOver = color(255, 200, 0);
color sliderHandleBg = sliderHandleUp;
float sliderValue = 0;
//clear button
float[]clearBtn;
color clearBtnOver = color(50, 50, 150);
color clearBtnUp = color(0, 0);
color clearBtnBg = clearBtnUp;
void setup(){
size(600, 400);
background(canvasBg);
frameRate(30);
// create fonts
titleFont = createFont("Arial", 11);
clearFont = createFont("Arial", 10);
// create icons
pencil = loadImage("particleImg2.png");
brush = loadImage("particleImg2.png");
eraser = loadImage("particleImg2.png");
// create panel coordinate arrays
menu = new float[]{
0, 0, width, 25 };
tools = new float[]{
0, menu[3], 50, 165 };
canvas = new float[]{
tools[2], menu[3], width-tools[2], height-menu[3]+1 };
// create button coordinate arrays
pencilBtn = new float[]{
tools[0]+5, tools[1]+10, tools[2]-11, 45 };
brushBtn = new float[]{
tools[0]+5, pencilBtn[1]+ pencilBtn[3]+5, tools[2]-11, 45 };
eraserBtn = new float[]{
tools[0]+5, brushBtn[1]+ brushBtn[3]+5, tools[2]-11, 45 };
// create slider coordinate arrays
sliderBar = new float[]{
width-150, menu[1]+menu[3]/2, 75, menu[1]+menu[3]/2 };
sliderHandle = new float[]{
sliderBar[0]+sliderBar[2]/2, sliderBar[1]-3, 6, 6 };
// create clear button coordinate array
clearBtn = new float[]{
width-45, 6, 31, 13 };
rect(tools[0], tools[1], tools[2], tools[3]);
// title
fill(175, 175, 220);
textFont(titleFont);
text("Processing Paint", 5, menu[1]+menu[3]-8);
// slider (controls stroke width)
stroke(255, 127, 0);
noFill();
// slider artwork
rect(sliderBar[0]-10, sliderBar[1]-1.5, 3, 3);
rect(sliderBar[0]-8.5, sliderBar[1]-.5, 3, 3);
// slider bar
rect(sliderBar[0]+sliderBar[2]+5, sliderBar[1]-3.5, 7, 7);
rect(sliderBar[0]+sliderBar[2]+7.5, sliderBar[1]-1, 7, 7);
stroke(255);
line(sliderBar[0], sliderBar[1], sliderBar[0]+ sliderBar[2], 
sliderBar[3]);
// slider handle
fill(sliderHandleBg);
stroke(150);
rect(sliderHandle[0], sliderHandle[1], sliderHandle[2], 
sliderHandle[3]);
// clear button
stroke(255, 200, 0);
fill(clearBtnBg);
rect(clearBtn[0],clearBtn[1], clearBtn[2], clearBtn[3]);
fill(255, 200, 0);
textFont(clearFont);
text("clear", width-40, menu[1]+menu[3]-10);
// pencil button
fill(pencilBg);
stroke(200);
rect(pencilBtn[0], pencilBtn[1], pencilBtn[2], pencilBtn[3]);
image(pencil, pencilBtn[0]+pencilBtn[2]/2-pencil.width/2, 
pencilBtn[1]+pencilBtn[3]/2-pencil.height/2);
// brush button
fill(brushBg);
stroke(200);
rect(brushBtn[0], brushBtn[1], brushBtn[2], brushBtn[3]);
image(brush, brushBtn[0]+brushBtn[2]/2-brush.width/2, 
brushBtn[1]+brushBtn[3]/2-brush.height/2);
// eraser button
fill(eraserBg);
stroke(200);
rect(eraserBtn[0], eraserBtn[1], eraserBtn[2], eraserBtn[3]);
image(eraser, eraserBtn[0]+eraserBtn[2]/2-eraser.width/2, 
eraserBtn[1]+eraserBtn[3]/2-eraser.height/2);
// draw palette
int paletteCounter=0;
for (float i=0; i<tools[2]-8; i+=8){
for (float j=menu[3]+tools[3]; j<height-8; j+=8){
fill(palette[paletteCounter++]);
strokeWeight(.5);
rect(i, j, 8, 8);
}
}
if (mousePressed && mouseX>tools[0]+tools[2] && 
mouseY>menu[1]+menu[3]) {
smooth();
//pencil
if (isPencilSelected){
stroke(paintColor);
strokeWeight(sliderValue);
line(mouseX, mouseY, pmouseX, pmouseY);
}
//brush
else if (isBrushSelected){
strokeWeight(.25);
float nozzleRadius = sliderValue;
float sprayFeather = sliderValue*4;
float strokeAngle = 0;
float px = 0, py = 0, px2 = 0, py2 = 0;
stroke(paintColor);
for (int i=0; i<360; i++){
px = mouseX-nozzleRadius*2+cos(radians(strokeAngle))* 
nozzleRadius+random(sprayFeather);
py = mouseY-nozzleRadius*2+sin(radians(strokeAngle))* 
nozzleRadius+random(sprayFeather);
px2 = pmouseX-nozzleRadius*2+cos(radians(strokeAngle))* 
nozzleRadius+random(sprayFeather);
py2 = pmouseY-nozzleRadius*2+sin(radians(strokeAngle))* 
nozzleRadius+random(sprayFeather);
line(px, py, px2, py2);
strokeAngle+=1;
}
}
//eraser
else if (isEraserSelected){
stroke(canvasBg);
strokeWeight(sliderValue*4);
line(mouseX, mouseY, pmouseX, pmouseY);
}
}
//slider dragging
if (isSliderMovable && mousePressed && mouseX > 
sliderBar[0] && mouseX<sliderBar[0]+sliderBar[2]){
sliderHandle[0] = mouseX-sliderHandle[2]/2;
}
sliderValue = (sliderHandle[0]-sliderBar[0]+10)*.25;
}

void mousePressed(){
//pencil
if (mouseX>pencilBtn[0] && mouseX<pencilBtn[0]+pencilBtn[2] && 
mouseY>pencilBtn[1] && mouseY<pencilBtn[1]+pencilBtn[3]){
// set selected button background color
pencilBg = buttonSelected;
// set boolean
isPencilSelected = true;
//set other buttons to unselected
deselectBtns(0);
} else
//brush
if (mouseX>brushBtn[0] && mouseX<brushBtn[0]+brushBtn[2] && 
mouseY>brushBtn[1] && mouseY<brushBtn[1]+brushBtn[3]){
// set selected button background color
brushBg = buttonSelected;
// set boolean
isBrushSelected = true;
//set other buttons to unselected
deselectBtns(1);
} else
//eraser
if (mouseX>eraserBtn[0] && mouseX<eraserBtn[0]+eraserBtn[2] && 
mouseY>eraserBtn[1] && mouseY<eraserBtn[1]+eraserBtn[3]){
// set selected button background color
eraserBg = buttonSelected;
// set boolean
isEraserSelected = true;
//set other buttons to unselected
deselectBtns(2);
} else
// set painting color
if (mouseX>tools[0] && mouseX<tools[0]+tools[2] && 
mouseY>tools[1]+tools[3] && mouseY<height){
paintColor = get(mouseX, mouseY);
}
}
void mouseReleased(){
// clear button repaints background
if (mouseX>clearBtn[0] && mouseX<clearBtn[0]+clearBtn[2] && 
mouseY>clearBtn[1] && mouseY<clearBtn[1]+clearBtn[3]){
canvasBg = paintColor;
fill(canvasBg);
rect(canvas[0], canvas[1], canvas[2], canvas[3]);
}
}
void mouseMoved(){
//pencil
if (!isPencilSelected){
if (mouseX>pencilBtn[0] && mouseX<pencilBtn[0]+pencilBtn[2] && 
mouseY>pencilBtn[1] && mouseY<pencilBtn[1]+pencilBtn[3]){
cursor(HAND);
// set buttonOver background color
pencilBg = buttonOver;
}
else {
pencilBg = buttonUp;
}
}
if (!isBrushSelected){
if (mouseX>brushBtn[0] && mouseX<brushBtn[0]+brushBtn[2] && 
mouseY>brushBtn[1] && mouseY<brushBtn[1]+brushBtn[3]){
cursor(HAND);
// set buttonOver background color
brushBg = buttonOver;
}
else {
brushBg = buttonUp;
}
}
if(!isEraserSelected){
if (mouseX>eraserBtn[0] && mouseX<eraserBtn[0]+eraserBtn[2] && 
mouseY>eraserBtn[1] && mouseY<eraserBtn[1]+eraserBtn[3]){
cursor(HAND);
// set buttonOver background color
eraserBg = buttonOver;
}
else {
eraserBg = buttonUp;
}
}
// set palette cursor
if (mouseX>tools[0] && mouseX<tools[0]+tools[2] && 
mouseY>tools[1]+tools[3] && mouseY<height){
cursor(ARROW);
}
// set painting cursor
if (mouseX>tools[0]+tools[2] && mouseX<width && 
mouseY>menu[1]+menu[3] && mouseY<height){
cursor(CROSS);
}
// slider handle detection and cursor
if (mouseX>sliderHandle[0] && mouseX<sliderHandle[0]+ 
sliderHandle[2] &&
mouseY>sliderHandle[1] && mouseY<sliderHandle[1]+ 
sliderHandle[3]){
cursor(HAND);
isSliderMovable = true;
sliderHandleBg = sliderHandleOver;
} else {
//cursor(CROSS);
isSliderMovable = false;
sliderHandleBg = sliderHandleUp;
}
// clear button detection and cursor
if (mouseX>clearBtn[0] && mouseX<clearBtn[0]+clearBtn[2] && 
mouseY>clearBtn[1] && mouseY<clearBtn[1]+clearBtn[3]){
cursor(HAND);
clearBtnBg = clearBtnOver;
} else {
clearBtnBg = clearBtnUp;
}
}
// reset unselected buttons (pencil, brush, eraser)
void deselectBtns(int index){
switch(index){
case 0:
brushBg = buttonUp;
eraserBg = buttonUp;
isBrushSelected = false;
isEraserSelected = false;
break;
case 1:
pencilBg = buttonUp;
eraserBg = buttonUp;
isPencilSelected = false;
isEraserSelected = false;
break;
case 2:
pencilBg = buttonUp;
brushBg = buttonUp;
isPencilSelected = false;
isBrushSelected = false;
break;
}
}