size(512, 384);
background(loadImage("2017-12-21.jpg"));
PImage img = loadImage("2017-12-21 - Copy.jpg");
int w = width/6;
int h = height/8;
for (int i=0; i<width; i+=w){
for (int j=0; j<height; j+=h){
blend(img, 0, 0, width, height, i, j, w, h, SUBTRACT);
}
}