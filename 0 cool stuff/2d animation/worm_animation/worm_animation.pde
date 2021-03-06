/* Worm
demonstrates springs in a series */
// for worm
int segments = 60;
float[] x = new float[segments];
float[] y = new float[segments];
float[] accelX = new float[segments];
float[] accelY = new float[segments];
float[] springing = new float[segments];
float[] damping = new float[segments];
// for food
float fx, fy;
float fCntrX, fCntrY;
float fAngle, fSpeedX = .25, fSpeedY = .5;
void setup(){
size(400, 400);
smooth();
// initialize array values
for (int i=0; i<segments; i++){
/* need to decrease both springing and
damping values as segments increase */
springing[i] = .05*(.07*(i+1));
damping[i] = .95-(.02*i);
}
// food center
fCntrX = width/2;
fCntrY = height/2;
}
void draw(){
// repaint background
fill(0, 10);
noStroke();
rect(0, 0, width, height);
createFood();
createWorm();
}
void createFood(){
// food moves in random wave pattern
fx = fCntrX + cos(radians(fAngle))*random(25);
fy = fCntrY + sin(radians(fAngle))*random(25);
fCntrX+=fSpeedX;
fCntrY+=fSpeedY;
fAngle+=random(-6, 6);
// keep food within display window
if (fCntrX>width-15 || fCntrX<15 ){
fSpeedX*=-1;
}
if (fCntrY>height-15 || fCntrY<15 ){
fSpeedY*=-1;
}
}
void createWorm(){
float[] deltaX = new float[segments];
float[] deltaY = new float[segments];
for (int i=0; i<segments; i++){
// lead ellipse
if (i==0){
/* food position used to calculate the
initial ellipse of the worm */
deltaX[i] = (fx-x[i]);
deltaY[i] = (fy-y[i]);
}
else {
/* preceding ellipse used to calculate the
next ellipse of the worm */
deltaX[i] = (x[i-1]-x[i]);
deltaY[i] = (y[i-1]-y[i]);
}
// create springing effect
deltaX[i] *= springing[i];
deltaY[i] *= springing[i];
accelX[i] += deltaX[i];
accelY[i] += deltaY[i];
// move worm
x[i] += accelX[i];
y[i] += accelY[i];
fill(0);
stroke(255);
// draw worm
if (i<segments/2){
ellipse(x[i], y[i], i, i);
}
else {
ellipse(x[i], y[i], segments-i, segments-i);
}
// slow down springing
accelX[i] *= damping[i];
accelY[i] *= damping[i];
}
}