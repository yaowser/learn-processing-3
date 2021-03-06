//Arcs with Bounding Boxes
void setup(){
size(400, 400);
background(255);
strokeWeight(10);
fill(127);
arc(103, 120, 130, 100, 0, PI);
ellipseMode(CORNER);
arc(103, 120, 130, 100, 0, HALF_PI);
ellipseMode(CORNERS);
arc(233, 220, 363, 320, 0, TWO_PI-HALF_PI);
// bounding boxes
strokeWeight(1);
noFill();
rect(103, 120, 130, 100);
rectMode(CENTER);
rect(103, 120, 130, 100);
rectMode(CORNERS);
rect(233, 220, 363, 320);
}