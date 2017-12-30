// Single rect with boundary collision detection
float speedX, speedY;
float x, y, w, h;
void setup(){
size(400, 400);
x=width/2;
y=height/2;
w=70;
h=w;
speedX = 2;
speedY = 1;
}
void draw(){
background(255);
rect(x, y, w, h);
x+=speedX;
y+=speedY;
// Check display window edge collisions
if (x > width-w){
x = width-w;
speedX*=-1;
}
else if (x < 0){
x = 0;
speedX*=-1;
}
else if (y > height-h){
y = height-h;
speedY*=-1;
}
else if (y < 0){
y = 0;
speedY*=-1;
}
}