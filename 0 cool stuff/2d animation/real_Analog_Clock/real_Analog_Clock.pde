/* Analog Clock
Ira Greenberg, October 9, 2006 */
PFont font;
float x, y, r = 100;
float textH = 12;
void setup(){
size(400, 400);
font = createFont("Arial", textH);
textFont(font);
x = width/2;
y = height/2;
smooth();
}
void draw(){
background(75);
drawClock();
}
void drawClock(){
float px, py, angle = -60;
fill(200);
strokeWeight(4);
ellipse(x, y, r*2, r*2);
for (int i=1; i<13; i++){
px = x+cos(radians(angle))*(r*.8);
py = y+sin(radians(angle))*(r*.8);
fill(0);
// need to subtract 1/2 text width/height
// to align center
float textW = textWidth(str(i));
text(i, px-textW/2, py+textH/2);
angle+=360/12;
}
/*Subtract 90 degs. from each trig function, since 12
is at top of clock (not at 0 postion on unit circle).
Other numeric value is calculated by 360/number of units.*/
//hour hand
strokeWeight(2);
stroke(50);
float h = hour();
float hourHandX = x+cos(radians(30*h-90))*(r*.5);
float hourHandY = y+sin(radians(30*h-90))*(r*.5);
line(x, y, hourHandX, hourHandY);
//minute hand
strokeWeight(1);
stroke(150);
float m = minute();
float minuteHandX = x+cos(radians(6*m-90))*(r*.7);
float minuteHandY = y+sin(radians(6*m-90))*(r*.7);
line(x, y, minuteHandX, minuteHandY);
//second hand
strokeWeight(1);
stroke(200, 100, 30);
float s = second();
float secondHandX = x+cos(radians(6*s-90))*(r*.9);
float secondHandY = y+sin(radians(6*s-90))*(r*.9);
line(x, y, secondHandX, secondHandY);
}