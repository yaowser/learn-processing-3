// Pixel Array Mask
size(600, 400);
// set background--the blue channel
// contributes to pixel mask
background(180, 90, 50);
//load but don't display image
PImage img = loadImage("2017-12-21.jpg");
// create a mask composed of rectangles
fill(255);
for (int i=0; i<2000; i++){
  rect(random(width), random(height), 5+random(15), 5+random(15));
}
// build pixel array of the screen
loadPixels();
// set mask
img.mask(pixels);
//draw image
image(img, 0, 0, 600, 400);