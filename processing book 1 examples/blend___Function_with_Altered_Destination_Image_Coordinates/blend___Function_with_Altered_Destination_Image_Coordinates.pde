// blend() Function with Altered Destination Image Coordinates
// background image and PImage should be 300 x 400 pixels
size(512, 384);
background(loadImage("2017-12-21.jpg"));
PImage img = loadImage("2017-12-21 - Copy.jpg");
blend(img, 0, 0, 300, 400, 0, 200, 300, 200, DARKEST);