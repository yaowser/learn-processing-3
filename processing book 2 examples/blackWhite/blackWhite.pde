// blackWhite.pde, chapter 9
void setup() {
PImage img = loadImage("2017-12-21.jpg");
size(img.width, img.height);
image(img, 0, 0);
loadPixels();
for (int i = 0; i < pixels.length; i++) {
color c = pixels[i];
pixels[i] = color(red(c)*0.3+green(c)*0.59+blue(c)*0.11);
}
updatePixels();
} // end setup()