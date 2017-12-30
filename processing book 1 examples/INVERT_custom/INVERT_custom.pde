//custom invert--version 3
// image should be 600 x 400 pixels
size(600, 400);
background(255);
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
loadPixels();
for (int i=0; i<(width*height); i++){
// separate out and invert component color values
int r = abs(int(red(pixels[i]))-255);
int g = abs(int(green(pixels[i]))-255);
int b = abs(int(blue(pixels[i]))-255);
int a = int(alpha(pixels[i]));
pixels[i] = color(r, g, b, a);
}
updatePixels();