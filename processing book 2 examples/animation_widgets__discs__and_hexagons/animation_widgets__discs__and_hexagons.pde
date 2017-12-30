// Sketch 6-6: widgets, discs, and hexagons
disc d;
hexagon h;
void setup() {
size(500, 500);
smooth();
d = new disc();
h = new hexagon();
} // setup()
void draw() {
background(255);
d.move();
d.display();
h.move();
h.display();
}