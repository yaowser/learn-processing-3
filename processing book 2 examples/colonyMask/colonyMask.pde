// colonyMask.pde, chapter 10
void setup() {
PImage img = loadImage("2017-12-21 - Copy.jpg");
PImage msk = loadImage("2017-12-21.jpg");
background(0);
size(512, 384);
img.mask(msk);
image(img, 0, 0);
} // end setup()