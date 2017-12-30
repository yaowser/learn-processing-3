// Cubes Contained Within a Cube
Cube stage; // external large cube
int cubies = 50;
Cube[]c = new Cube[cubies]; // internal little cubes
color[][]quadBG = new color[cubies][6];
// controls cubie's movement
float[]x = new float[cubies];
float[]y = new float[cubies];
float[]z = new float[cubies];
float[]xSpeed = new float[cubies];
float[]ySpeed = new float[cubies];
float[]zSpeed = new float[cubies];
// controls cubie's rotation
float[]xRot = new float[cubies];
float[]yRot = new float[cubies];
float[]zRot = new float[cubies];
// size of external cube
float bounds = 300;
void setup(){
size(400, 400, P3D);
for (int i=0; i<cubies; i++){
// each cube face has a random color component
float colorShift = random(-75, 75);
quadBG[i][0] = color(175+colorShift, 30, 30);
quadBG[i][1] = color(30, 175+colorShift, 30);
quadBG[i][2] = color(30, 30, 175+colorShift);
quadBG[i][3] = color(175+colorShift, 175+colorShift, 30);
quadBG[i][4] = color(175+colorShift, 30, 175+colorShift);
quadBG[i][5] = color(175+colorShift, 87+colorShift, 30);
// cubies are randomly sized
float cubieSize = random(5, 15);
c[i] = new Cube(cubieSize, cubieSize, cubieSize);
//initialize cubie's position, speed and rotation
x[i] = 0;
y[i] = 0;
z[i] = 0;
xSpeed[i] = random(-2, 2);
ySpeed[i] = random(-2, 2);
zSpeed[i] = random(-2, 2);
xRot[i] = random(40, 100);
yRot[i] = random(40, 100);
zRot[i] = random(40, 100);
}
// instantiate external large cube
stage = new Cube(300, 300, 300);
}
void draw(){
background(50);
// center in display window
translate(width/2, height/2, -130);
// outer transparent cube
noFill();
// rotate everything, including external large cube
rotateX(frameCount*PI/225);
rotateY(frameCount*PI/250);
rotateZ(frameCount*PI/275);
stroke(255);
// draw external large cube
stage.create();
//move/rotate cubies
for (int i=0; i<cubies; i++){
pushMatrix();
translate(x[i], y[i], z[i]);
rotateX(frameCount*PI/xRot[i]);
rotateY(frameCount*PI/yRot[i]);
rotateX(frameCount*PI/zRot[i]);
noStroke();
c[i].create(quadBG[i]);
x[i]+=xSpeed[i];
y[i]+=ySpeed[i];
z[i]+=zSpeed[i];
popMatrix();
// draw lines connecting cubbies
stroke(10);
if (i<cubies-1){
line(x[i], y[i], z[i], x[i+1], y[i+1], z[i+1]);
}
// check wall collisions
if (x[i]>bounds/2 || x[i]<-bounds/2){
xSpeed[i]*=-1;
}
if (y[i]>bounds/2 || y[i]<-bounds/2){
ySpeed[i]*=-1;
}
if (z[i]>bounds/2 || z[i]<-bounds/2){
zSpeed[i]*=-1;
}
}
}