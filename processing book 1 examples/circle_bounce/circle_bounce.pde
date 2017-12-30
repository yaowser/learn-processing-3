float x, y, r = 20;
float speedX = 2, speedY = 2.5;
void setup(){
size(400, 400);
x = width/2;
y = height/2;
noStroke();
smooth();
}
void draw(){
background(0);
x+=speedX;
y+=speedY;
ellipse(x, y, r*2, r*2);
// check wall collisions
if (x > width-r){
x = width-r;
speedX*=-1;
}
else if (x < r){
x = r;
speedX*=-1;
}
else if (y > height-r){
y = height-r;
speedY*=-1;
}
else if (y < r){
y = r;
speedY *=-1;
}
}