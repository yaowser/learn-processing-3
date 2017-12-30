// pixelation.pde, chapter 9
void setup() {
PImage img = loadImage("2017-12-21.jpg");
int resolution = 50;
size(512, 384);
int xInc = width/resolution; // increment in the x direction in pixels
int yInc = height/resolution; // increment in the y direction in pixels
for (int y=0; y<img.height; y+=yInc) {
for (int x=0; x<img.width; x+=xInc) {
fill(img.get(x, y));
rect(x, y, xInc, yInc);
}
}
} // end setup()