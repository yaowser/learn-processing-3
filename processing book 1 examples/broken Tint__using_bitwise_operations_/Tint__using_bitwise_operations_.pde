/* Tint (using bitwise operations)
Created January 18, 2006
updated December 4, 2006 */
size(600, 400);
PImage img = loadImage("2017-12-21.jpg");
PImage img2 = createImage(img.width, img.height, RGB);
// copy pixels array from img to img2
arrayCopy(img.pixels, img2.pixels);
int r, g, b, a;
int row = height/6;
for(int i=0; i<width*height; i++){
// get untinted component values
r = img2.pixels[i] >> 16 & 0xFF;
g = img2.pixels[i] >> 8 & 0xFF;
b = img2.pixels[i] & 0xFF;
a = img2.pixels[i] >> 24 & 0xFF;
// tint based on height in display window
if (i<width*row){
r =255;
} else if (i>width*row && i<width*row*2){
r = 255;
g = 255;
} else if (i>width*row*2 && i<width*row*3){
b = 255;
} else if (i>width*row*3 && i<width*row*4){
g = 255;
} else if (i>width*row*4 && i<width*row*5){
r = 255;
b = 255;
} else {
r = 255;
g = 127;
}
// combine components back into a 32-bit integer
img2.pixels[i] = (a << 24) | (r << 16) | (g << 8) | b;
}
// draw images
image(img, 0, 0);
image(img2, width/2, 0);