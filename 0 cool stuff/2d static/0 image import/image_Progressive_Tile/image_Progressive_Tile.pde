/*
Progressive Tile
Ira Greenberg, November 12, 2005
*/
size(480, 480);
background(255);
PImage img = loadImage("2017-12-21.jpg");
float x = 0, y =0;
float w = 240*.5;
float h = w;
for (int i=0; i<height; i+=h){
for (int j=0; j<width; j+=w){
image(img, j, i, w, h);
}
// avoid infinite loop
// Zeno's paradox waiting to happen
if (w>5){
w*=.81;
h*=.81;
}
}