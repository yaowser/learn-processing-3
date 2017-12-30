//Image Tiling
size(650, 450);
PImage img2 = loadImage("2017-12-21.jpg");
int cols = 8;
int rows = 8;
int w = width/cols;
int h = height/rows;
for (int i=0; i<height; i+=h){
for (int j=0; j<width; j+=w){
image(img2, j, i, w, h);
}
}