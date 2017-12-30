// Disintegrating Quad Wall
float randShift = .2;
int quadW = 15;
int quadH = quadW;
float[]q = { -quadW/2, -quadH/2, quadW, quadH };
void setup() {
size(600, 600);
background(255);
smooth();
noStroke();
/* generate a table structure of
quads progressivley adding more
randomization to each quad */
for (int i=0, k=1; i<height-quadH; i+=quadH, k++){
/* resetting the transformation matrix
keeps the translations from continually
accumulating. Try commenting out the
resetMatrix() call to see the effect. */
resetMatrix();
translate(0, quadH*k);
for (int j=0; j<width-quadW; j+=quadW){
translate(quadW, 0);
fill(random(0, 255));
// r(k) is a function call
quad(q[0]+r(k), q[1]+r(k), 
q[0]+q[2]+r(k), q[1]+r(k), 
q[0]+q[2]+r(k), q[1]+q[3]+r(k), 
q[0]+r(k), q[1]+q[3]+r(k));
}
}
}
float r(int i){
return random(-i*randShift, i*randShift);
}