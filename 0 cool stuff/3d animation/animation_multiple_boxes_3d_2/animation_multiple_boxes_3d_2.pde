// Multiple Translations with pushMatrix() and popMatrix()
void setup(){
size(400, 400, P3D);
}
void draw(){
background(0);
translate(width/2, height/2);
rotateY(frameCount*PI/60);
pushMatrix();
translate(-50, -50);
fill(255, 0, 0);
box(100, 100, 100);
popMatrix();
pushMatrix();
translate(50, -50);
fill(255, 255, 0);
box(100, 100, 100);
popMatrix();
pushMatrix();
translate(50, 50);
fill(0, 0, 255);
box(100, 100, 100);
popMatrix();
pushMatrix();
translate(-50, 50);
fill(0, 255, 0);
box(100, 100, 100);
popMatrix();
}