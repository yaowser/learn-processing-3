// Severe BLUR Filter
// image should be 600 x 400 pixels
size(600, 400);
background(255);
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
filter(BLUR, 10);