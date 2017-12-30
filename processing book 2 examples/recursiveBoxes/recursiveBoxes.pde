// recursiveBoxes.pde, chapter 8
void setup() {
size(500, 500);
background(255);
rectMode(CENTER);
noFill();
stroke(0);
drawBox(width/2, height/2, width/2);
} // end setup()
// Draw boxes recursively, centered at cx, cy, with size d.
void drawBox(float cx, float cy, float d) {
strokeWeight(0.1*d);
stroke(d);
rect(cx, cy, d, d);
// Base case.
if (d < 20) return;
//recursive calls
drawBox(cx-d/2, cy-d/2, d/2);
drawBox(cx+d/2, cy-d/2, d/2);
drawBox(cx-d/2, cy+d/2, d/2);
drawBox(cx+d/2, cy+d/2, d/2);
} // end drawBoxes()