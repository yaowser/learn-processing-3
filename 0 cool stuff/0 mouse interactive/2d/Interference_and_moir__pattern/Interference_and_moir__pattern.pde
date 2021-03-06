/* Interference and moiré pattern
Ira Greenberg, October 18, 2005 */
float interval;
float spacer;
// Experiment with these values
float angle = 0;
float amplitude = .05;
float waveGap = 10;
float frequency = .1;
float ringGrowthRate = .5;
boolean isInactive = true;
void setup(){
size(400, 400);
interval = width*.03;
spacer = interval;
noFill();
frameRate(30);
}
void draw(){
background(0);
stroke(255);
float py = 0;
/* This nested for loop fills the frame
with a wave pattern. Some of its properties
are controlled, in part, by the mouse position*/
for (int i=0; i<height; i+=waveGap){
for (int j=0; j<width; j++){
py = i+sin(radians(angle))*mouseY*amplitude;
point(j, py);
angle+=mouseX*frequency;
}
}
// draw concentric ring pattern
for (int i=0; i<width/2*spacer/interval; i+=spacer){
ellipse(mouseX, mouseY, 10+i, 10+i);
}
// describe mouse press behavior
if (mousePressed){
angle = 0;
isInactive = false;
// grow rings
if (spacer < interval*2){
spacer += ringGrowthRate;
}
}
// shrink rings
if (isInactive){
if (spacer> interval){
spacer -= ringGrowthRate;
}
}
}
// allows ring to shrink
void mouseReleased(){
isInactive = true;
}