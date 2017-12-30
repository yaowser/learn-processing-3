//recursiveTree.pde, chapter 8
void setup() {
size(800, 800);
background(255);
drawTree(width/2, height, 175, 90);
} //end setup()
void drawTree(float x0, float y0, float len, float angle) {
if (len > 2) {
float x1 = x0 + cos(radians(angle))*len;
float y1 = y0 - sin(radians(angle))*len;
line(x0, y0, x1, y1);
drawTree(x1, y1, len*0.75, angle + 30);
drawTree(x1, y1, len*0.66, angle - 50);
}
} // end drawTree()