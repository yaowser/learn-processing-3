int xpos, ypos;
int xspeed=3;
int yspeed=5;
void setup(){
size(400, 400);
}
void draw(){
background(0);
rect(getXMotion(), ypos, 10, 10);
ypos+=yspeed;
checkCollisions(xpos, ypos);
}
void checkCollisions(int xp, int yp){
if (xp>=width-10 || xp<=0){
xspeed*=-1;
}
if (yp>=width-10 || yp<=0){
yspeed*=-1;
}
}
int getXMotion(){
xpos+=xspeed;
return xpos;
}
void checkCollisions(float yp, float yp2){
if (yp<=0){
xspeed*=-1;
}
if (yp<=0){
yspeed*=-1;
}
}