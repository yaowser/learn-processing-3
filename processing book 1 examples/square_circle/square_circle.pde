//Ellipses with Bounding Boxes
void setup(){
size(400, 400);
background(255);
strokeWeight(10);
fill(127);
ellipse(103, 120, 130, 100);
ellipseMode(CORNER);
ellipse(103, 120, 130, 100);
ellipseMode(CORNERS);
ellipse(233, 220, 363, 320);
// bounding boxes
strokeWeight(1);
noFill();
rect(103, 120, 130, 100);
rectMode(CENTER);
rect(103, 120, 130, 100);
rectMode(CORNERS);
rect(233, 220, 363, 320);
}