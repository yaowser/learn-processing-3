// Mask the Sky
size(600, 480);
background(185, 185, 250);
PImage img = loadImage("2017-12-21.jpg");
PImage mask = loadImage("2017-12-21 - Copy.jpg");
img.mask(mask);
image(img, 0, 0, 600, 480);