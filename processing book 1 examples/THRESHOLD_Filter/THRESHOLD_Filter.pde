// THRESHOLD Filter
// filter(THRESHOLD, float threshold level)
// image should be 200 x 200 pixels
size(800, 200);
PImage img = loadImage("2017-12-21.jpg");
float thresholdLevel = 1.0;
for (int i=0; i<4; i++){
image(img, 200*i, 0, 200, 200);
filter(THRESHOLD, thresholdLevel);
thresholdLevel-=.25;
}