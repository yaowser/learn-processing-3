// blending.pde, chapter 10
void setup() {
PImage src = loadImage("2017-12-21.jpg"); // blending image
PImage dest = loadImage("2017-12-21 - Copy.jpg"); // background image for sketch window
size(512, 384); // size sketch window as background image
background(dest); // load image into background
blend(src, 0, 0, src.width, src.height, 0, 0, dest.width, dest.height, DARKEST);
} // end setup()