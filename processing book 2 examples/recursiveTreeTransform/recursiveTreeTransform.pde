//recursiveTreeTransform.pde. chapter 8
void setup() {
size(800, 800);
background(255);
translate(width/2, height);
drawTree(175, -90);
} //end setup()
void drawTree(float len, float angle) {
if (len > 2) {
rotate(radians(angle));
line(0, 0, len, 0);
translate(len, 0);
pushMatrix();
drawTree(len*0.75, -30);
popMatrix();
pushMatrix();
drawTree(len*0.66, 50);
popMatrix();
}
} // end drawTree()