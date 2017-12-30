//Pixilate
size(600, 400);
PImage img = loadImage("2017-12-21.jpg");
//noStroke();
int detail = 10;
for ( int i=0; i<width; i+=detail){
for ( int j=0; j<height; j+=detail){
color c = img.get(i, j);
fill(c);
rect(i, j, detail, detail);
}
}