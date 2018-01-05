// Final Interactive Button Example
// font used for button text
PFont myFont;
//buttons
float btn1X, btn1Y, btn1W, btn1H;
float btn2X, btn2Y, btn2W, btn2H;
float btn3X, btn3Y, btn3W, btn3H;
color btnUpState = color(200, 200, 200);
color btnOverState = color(200, 200, 50);
color btnDownState = color(255, 150, 20);
color btn1Background = btnUpState;
color btn2Background = btnUpState;
// moving square
float x = 25;
float w = 10;
float h = w;
// randomly place square y position on screen
float y = random(h/2, 70);
float xSpeed = 0;
color movingSquareBackground = color(random(255), 
random(255), random(255));
//controls mouse trails
boolean isTrailable = false;
// mouse trails check box
boolean isTrailsSelected = false;
void setup(){
size(600, 100);
// load font from within the sketch's data directory
//buttons
//speed- button
btn1X = 250;
btn1Y = height-20;
btn1W = 50;
btn1H = 20;
//speed+ button
btn2X = width-250;
btn2Y = height-20;
btn2W = 50;
btn2H = 20;
// check box controls mouse trails
btn3X = width-60;
btn3Y = height-20;
btn3W = 10;
btn3H = 10;
}
void draw(){
rectMode(CENTER);
// mouse trails
if (isTrailable){
fill(150, 16);
rect(width/2, height/2, width, height);
}
else {
background(150);
}
stroke(100);
//btn 1 - decreases speed
fill(btn1Background);
rect(btn1X, btn1Y, btn1W, btn1H);
fill(75);
text("speed -", btn1X-17, btn1Y+btn1H/4);
//btn2 - increases speed
fill(btn2Background);
rect(btn2X, btn2Y, btn2W, btn2H);
fill(75);
text("speed +", btn2X-17, btn2Y+btn2H/4);
//btn3 - check box controls mouse trails
fill(255);
rect(btn3X, btn3Y, btn3W, btn3H);
fill(75);
text("trails", btn3X+10, btn3Y+btn3H/4);
if (isTrailsSelected){
// draw x in box
line(btn3X-btn3W/2, btn3Y-btn3H/2, btn3X+btn3W/2, btn3Y+btn3H/2);
line(btn3X-btn3W/2, btn3Y+btn3H/2, btn3X+btn3W/2, btn3Y-btn3H/2);
}
//moving square
fill(movingSquareBackground);
noStroke();
rect(x, y, w, h);
x+=xSpeed;
// show speed
rect(x, y, w, h);
fill(75);
text(xSpeed, 10, height-10);
// ensure square stays on screen
if (x>width){
x = 0;
y = random(h/2, 70);
movingSquareBackground = color(random(255), 
random(255), random(255));
}
else if (x<0){
x = width;
y = random(h/2, 70);
movingSquareBackground = color(random(255), 
random(255), random(255));
}
}
void mousePressed(){
if (mouseX>btn1X-btn1W/2 && mouseX< btn1X+btn1W/2 && 
mouseY>btn1Y-btn1H/2 && mouseY< btn1Y+btn1H/2){
  xSpeed-=.2;
btn1Background = btnDownState;
}
if (mouseX>btn2X-btn2W/2 && mouseX< btn2X+btn2W/2 && 
mouseY>btn2Y-btn2H/2 && mouseY< btn2Y+btn2H/2){
xSpeed+=.2;
btn2Background = btnDownState;
}
if (mouseX>btn3X-btn3W/2 && mouseX< btn3X+btn3W/2 && 
mouseY>btn3Y-btn3H/2 && mouseY< btn3Y+btn3H/2){
if (isTrailsSelected) {
isTrailsSelected = false;
isTrailable = false;
}
else {
isTrailsSelected = true;
isTrailable = true;
}
}
}
void mouseReleased(){
if (btn1Background==btnDownState){
btn1Background = btnOverState;
}
else if (btn2Background==btnDownState){
btn2Background = btnOverState;
}
}
void mouseMoved(){
if (mouseX>btn1X-btn1W/2 && mouseX< btn1X+btn1W/2 && 
mouseY>btn1Y-btn1H/2 && mouseY< btn1Y+btn1H/2){
cursor(HAND);
btn1Background = btnOverState;
}
else {
cursor(ARROW);
btn1Background = btnUpState;
}
if (mouseX>btn2X-btn2W/2 && mouseX< btn2X+btn2W/2 && 
mouseY>btn2Y-btn2H/2 && mouseY< btn2Y+btn2H/2){
cursor(HAND);
btn2Background = btnOverState;
}
else {
cursor(ARROW);
btn2Background = btnUpState;
}
//button 3
if (mouseX>btn3X-btn3W/2 && mouseX< btn3X+btn3W/2 && 
mouseY>btn3Y-btn3H/2 && mouseY< btn3Y+btn3H/2){
cursor(HAND);
}
else {
cursor(ARROW);
}
}