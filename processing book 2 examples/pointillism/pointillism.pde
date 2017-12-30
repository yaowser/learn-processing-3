// pointillism.pde, chapter 10
void setup() {
PImage img = loadImage("2017-12-21.jpg");
size(512, 384);
imageMode(CENTER);
image(img, width/2, height/2);
noStroke();
loadPixels();
// Cover with random circles
for (int i=0; i<10000; i++) {
addPoint();
}
} // end setup()
// Add a random filled circle to screen
void addPoint() {
int x = (int)random(width);
int y = (int)random(height);
int i = x + width*y;
color c = pixels[i];
fill(c);
ellipse(x, y, 7, 7);
} // end addPoint()