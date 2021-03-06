// Cubic Grid
float boxSize = 40;
float margin = boxSize*2;
float depth = 400;
color boxFill;
void setup(){
size(400, 400, P3D);
noStroke();
}
void draw(){
background(255);
// center and spin grid
translate(width/2, height/2, -depth/2);
rotateY(frameCount*PI/60);
rotateX(frameCount*PI/60);
// build grid using multiple translations
for (float i=-depth/2+margin; i<=depth/2-margin; i+=boxSize){
pushMatrix();
for (float j=-height/2+margin; j<=height/2-margin; j+=boxSize){
pushMatrix();
for (float k=-width/2+margin; k<=width/2-margin; k+=boxSize){
// base fill color on counter values, abs function
// ensures values stay within legal range
boxFill = color(abs(i), abs(j), abs(k), 50);
pushMatrix();
translate(k, j, i);
fill(boxFill);
box(boxSize, boxSize, boxSize);
popMatrix();
}
popMatrix();
}
popMatrix();
}
}