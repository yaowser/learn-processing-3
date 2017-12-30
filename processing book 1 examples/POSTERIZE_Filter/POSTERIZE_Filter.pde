// POSTERIZE Filter
// filter(POSTERIZE, int colorLevels);
// image should be 200 x 200 pixels
size(1000, 200);
background(255);
PImage img = loadImage("2017-12-21.jpg");
int cols = 5;
int w = width/cols;
int h = height;
int[]vals = {2, 4, 8, 16, 32};
for (int i=0; i<cols; i++){
image(img, i*w, 0, w, h);
filter(POSTERIZE, vals[i]);
}