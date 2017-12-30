// GRAY Filter
// filter(GRAY)
// image should be 600 x 450 pixels
size(600, 450);
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
filter(GRAY);