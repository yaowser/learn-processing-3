/*
Color Variations Filter Using
Bitwise Operations
Ira Greenberg, November 11, 2005
revised: April 3, 2007
*/
/*change display size to accommodate
the size of your image */
size(360, 600);
/*remember to add an image into
the sketch data directory before
using loadImage() and also to update
the name of the image below. */
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
// pixel array
int[]pxls = new int[width*height];
// holds shifted colors
color[]newCol = new int[width*height];
// keep track of pixels
int pxlCounter = 0;
/* loop gets color components out
of color integer using bitwise operators
and shifts color components before
rebuilding pixel array- effect is similar
to Photoshop's variations filter */
for (int i=0; i<width; i++){
for (int j=0; j<height; j++){
pxls[pxlCounter] = get(i, j);
int r = pxls[pxlCounter] >> 16 & 0xFF;
int g = pxls[pxlCounter] >> 8 & 0xFF;
int b = pxls[pxlCounter] & 0xFF;
int a = pxls[pxlCounter] >> 24 & 0xFF;
/* conditionals check where we are in the image
min() functions keep color component values in
range 0-255 to avoid psychadelic artifacting */
//left column, top row(red+)
if (i<=width/3 && j<=height/3){
r = min(r*2, 255);
} //left column, middle row(green+)
else if (i<=width/3 && j> height/3 && j<=height*.667){
g = min(g*2, 255);
} //left column, bottom row(blue+)
else if (i<=width/3 && j>height*.667 && j<height){
b = min(b*2, 255);
}
//middle column, top row(value-)
if (i>width/3 && i<=width*.667 && j<=height/3){
r*=.4;
g*=.4;
b*=.4;
} //middle column, middle row(normal)
else if (i>width/3 && i<=width*.667 && j>height/3 && 
j<=height*.667){
// leave pixels alone in middle box
} //middle column, bottom row(value+)
else if (i>width/3 && i<=width*.667 && j<height){
r = min(r*2, 255);
g = min(g*2, 255);
b = min(b*2, 255);
}
//right column, top row(yellow+)
if (i>width*.667 && j<=height/3){
r = min(r*2, 255);
g = min(g*2, 255);
} //right column, middle row(purple+)
else if (i>width*.667 && j>height/3 && j<=height*.667){
r = min(r*2, 255);
b = min(b*2, 255);
} //right column, bottom row(orange+)
else if (i>width*.667 && j<height){
r = min(r*2, 255);
g = min(int(g*1.5), 255);
}
// put colors back together
newCol[pxlCounter] = (a << 24) | (r << 16) | (g << 8) | b;
/*The counter needs to be incremented each
iteration of the loop, and I'm doing it
within the array brackets. Since that's the last
place it's used in the loop, it's ok to do this*/
set(i, j, newCol[pxlCounter++]);
}
}