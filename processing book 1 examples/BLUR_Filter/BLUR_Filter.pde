// BLUR Filter
// filter(BLUR, int radius);
// image should be 200 x 200 pixels
size(1000, 200);
PImage img = loadImage("2017-12-21.jpg");
int cols = 5;
int w = width/cols;
int h = height;
// cumulative blur
for (int i=0; i<cols; i++){
image(img, i*w, 0, w, h);
filter(BLUR);
}