/*
Box Springs
Ira Greenberg, November 13, 2005
revised October 11, 2006
move mouse over white rectangle
*/
// you can change block count
int blocks = 40;
float margin = 50;
float boxHeight = 75;
//lots of arrays
float[]x = new float[blocks];
float[]y = new float[blocks];
float[]w = new float[blocks];
float[]h = new float[blocks];
float[]py1 = new float[blocks];
float[]py2 = new float[blocks];
float[]radius = new float[blocks];
float[]amplitude = new float[blocks];
float[]frequency = new float[blocks];
float[]ang = new float[blocks];
float[]drag = new float[blocks];
float[]gravity = new float[blocks];
boolean[]isOver = new boolean[blocks];
void setup(){
size(400, 300);
background(0);
noStroke();
frameRate(30);
/* amplitude, gravity, and frequency
can be messed with. Also, if you remove
the random functions, you can get more
standard wave patterns
*/
for (int i=0; i<blocks; i++){
w[i] = (width-margin)/blocks;
h[i] = boxHeight;
x[i] = margin/2+w[i]*i;
y[i] = height/2-h[i]/2;
amplitude[i] = random(20)+height/4;
radius[i] = amplitude[i];
gravity[i] = .85+random(.13);
drag[i] = gravity[i];
drawBlocks(x[i], y[i], w[i], h[i]);
frequency[i] = 12+random(-5, 5);
//flags let us know which box
//we’re over
isOver[i] = false;
}
}
//main loop
void draw(){
fill(0, 50);
rect(0, 0, width, height);
fill(255, 255, 0);
for (int i=0; i<blocks; i++){
//you can add/subtract py1, py2 to x
//and width arguments as well
drawBlocks(x[i], y[i]-py1[i], w[i], h[i]+py2[i]);
// flags set in mouseMoved function
if (isOver[i]){
//trig controls spring effect
py1[i] = sin(radians(ang[i]))*radius[i];
py2[i] = cos(radians(ang[i]))*radius[i];
// spring values affect color shift
fill(255, 255-radius[i], radius[i]*2);
ang[i]+=frequency[i];
radius[i]*=drag[i];
}
}
}
/*While mosue is moving, detect what
box the mouse is over and change flag.
Also, need to reset radius, which is
decremented by drag - causing blocks to
stop */
void mouseMoved(){
for (int i=0; i<blocks; i++){
if (mouseX>x[i] && mouseX<x[i]+w[i] &&
mouseY>y[i] && mouseY<y[i]+h[i]){
radius[i] = amplitude[i];
isOver[i] = true;
}
}
}
//function to draw rectangles, called initially by
//setup and then repeatedly in draw loop
void drawBlocks(float x, float y, float w, float h){
rect(x, y, w, h);
}