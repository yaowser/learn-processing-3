// Start Button
// button
float btnX, btnY, btnW, btnH;
// moving rectangle
float x = 25;
float y = 30;
float w = 10;
float h = w;
float xSpeed = 0;
void setup(){
size(600, 100);
btnX = width/2;
btnY = height-20;
btnW = 50;
btnH = 20;
}
void draw(){
background(200);
rectMode(CENTER);
fill(250);
stroke(150);
rect(btnX, btnY, btnW, btnH);
fill(0);
noStroke();
rect(x, y, w, h);
x+=xSpeed;
}
void mousePressed(){
if (mouseX>btnX-btnW/2 && mouseX< btnX+btnW/2 && 
mouseY>btnY-btnH/2 && mouseY< btnY+btnH/2){
xSpeed+=.2;
}
}