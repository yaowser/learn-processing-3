// pixelBufferMask.pde, chapter 10
void setup() {
PImage img = loadImage("2017-12-21.jpg");
size(512, 384);
background(100, 130, 50); // green, blue channel used for alpha mask
for (int i=0; i<3000; i++) {
rect(random(width), random(height), 5+random(20), 5+random(20));
}
loadPixels();
img.mask(pixels);
image(img, 0, 0);
} // end setup()