// Sketch 5-2: Interactive curveVertex() example using arrays
float [] ax; // x-anchor points
float [] ay; // y-anchor points
int N = 5; // number of anchor points
int isOnAnchor; // anchor point was selected
float radius = 5;
// gui to control curvature
float curvature = 0;
float sliderBarX, sliderBarY, sliderBarW;
float sliderHandleX, sliderHandleY, sliderHandleW = 12;
float sliderMin = -3, sliderMax = 3;
boolean isOnSliderHandle;
void setup() {
size(600, 600);
background(255);
ax = new float[N]; // create anchor point arrays and initialize
ay = new float[N];
for (int i=0; i < N; i++) {
ax[i] = random(100, width-100);
ay[i] = random(100, height-100);
}
// control bar for intractive curvature
sliderBarW = width/3;
sliderBarX = width-sliderBarW-40;
sliderBarY = height-40;
sliderHandleX = sliderBarX + sliderBarW/2;
sliderHandleY = sliderBarY;
} // setup()
void draw() {
background(255);
noFill();
strokeWeight(4);
stroke(0);
curveTightness(curvature);
// draw curve
beginShape();
curveVertex(ax[0], ay[0]); // double initial point
for (int i=0; i<N; i++) { // specify all anchor points
curveVertex(ax[i], ay[i]);
}
curveVertex(ax[N-1], ay[N-1]); // double final point
endShape();
// draw control/anchor points
strokeWeight(1);
fill(255, 127, 0);
for (int i=0; i<N; i++) {
ellipse(ax[i], ay[i], radius*2, radius*2);
}
// detect if mouse is on control/anchor point
for (int i=0; i<N; i++) {
if (dist(mouseX, mouseY, ax[i], ay[i]) < radius)
isOnAnchor = i;
}
// ensure boolean flags set back to false when mouse released
if (!mousePressed) {
isOnSliderHandle = false;
isOnAnchor = -1;
}
// interactively control curvature
setCurvatureControlGUI();
} // draw()
void setCurvatureControlGUI() {
line(sliderBarX, sliderBarY, sliderBarX+sliderBarW, sliderBarY);
fill(0, 0, 255);
rect(sliderHandleX-sliderHandleW/2, sliderHandleY-sliderHandleW/2, sliderHandleW,
sliderHandleW);
if (isOnSliderHandle && mouseX>sliderBarX && mouseX < sliderBarX + sliderBarW) {
sliderHandleX = mouseX;
}
// detect if mouse is on control/anchor point
if (dist(mouseX, mouseY, sliderHandleX, sliderHandleY) < sliderHandleW/2) {
isOnSliderHandle = true;
}
// ensures slider handle values between to sliderMin to sliderMax
curvature = map(sliderHandleX, sliderBarX, sliderBarX+sliderBarW, sliderMin, sliderMax);
} // setCurvature()
void mouseDragged() {
// move points
if (isOnAnchor >=0 && isOnAnchor <N) {
ax[isOnAnchor] = mouseX;
ay[isOnAnchor] = mouseY;
}
} // mouseDragged()