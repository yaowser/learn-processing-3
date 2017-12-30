/* blend() Function Using SUBTRACT
with Random Source Coodinates */
size(512, 384);
background(loadImage("2017-12-21.jpg"));
PImage img = loadImage("2017-12-21 - Copy.jpg");
int w = width/12;
int h = height/16;
for (int i=0; i<width; i+=w){
for (int j=0; j<height; j+=h){
// arguments need to be integers
int srcX = int(random(width-w));
int srcY = int(random(height-h));
int srcW = int(random(w));
int srcH = int(random(h));
blend(img, srcX, srcY, srcW, srcH, i, j, w, h, SUBTRACT);
}
}