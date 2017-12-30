// blend() Function Example sketch
// background image and PImage should both be 300 x 400 pixels

size(512, 384);
background(loadImage("2017-12-21.jpg"));
PImage img = loadImage("2017-12-21 - Copy.jpg");
blend(img, 0, 0, 512, 384, 0, 0, 512, 384, DARKEST);
// blend() PImage Method sketch
// both PImages should be 300 x 400 pixels
size(512, 384);
PImage img1 = loadImage("2017-12-21.jpg");
PImage img2 = loadImage("2017-12-21 - Copy.jpg");
img2.blend(img1, 0, 0, 512, 384, 0, 0, 512, 384, DARKEST);
image(img2, 0, 0);