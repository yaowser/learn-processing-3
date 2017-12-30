// cone.pde, chapter 9
void setup() {
float distance, r, g, b;
size(400, 400);
loadPixels();
// Access pixels as a 2D array
for (int y=0; y<height; y++) {
for (int x=0; x<width; x++) {
// Compute distance to center of sketch
distance = dist(x, y, width/2, height/2);
r = map(distance, 0, width/2, 20, 200);
g = map(distance, 0, width/2, 20, 100);
b = map(distance, 0, width/2, 140, 0);
pixels[y*width+x] = color(r, g, b);
}
}
updatePixels();
} // end setup()