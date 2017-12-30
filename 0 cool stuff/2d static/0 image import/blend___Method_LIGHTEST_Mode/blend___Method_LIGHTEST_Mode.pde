/* PImage blend() Method LIGHTEST Mode
--Random Source Coodinates & save() */
size(512, 384);

PImage img1 = loadImage("2017-12-21.jpg");
PImage img2 = loadImage("2017-12-21 - Copy.jpg");
int w = width/24;
int h = height/32;
for (int i=0; i<width; i+=w){
for (int j=0; j<height; j+=h){
// arguments need to be integers
int srcX = int(random(width-w));
int srcY = int(random(height-h));
int srcW = int(random(w));
int srcH = int(random(h));
img1.blend(img2, srcX, srcY, srcW, srcH, i, j, w, h, LIGHTEST);
}
}
image(img1, 0, 0);
save("tower_mosaic.tif");