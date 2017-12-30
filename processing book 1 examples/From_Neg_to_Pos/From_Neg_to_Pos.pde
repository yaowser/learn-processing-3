// From Neg to Pos
size(600, 400);
background(255);
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
loadPixels();
float invertFactor = 255.0;
for (int i=0; i<pixels.length; i++){
  // separate out and invert component color values
float r = abs(red(pixels[i])-invertFactor);
float g = abs(green(pixels[i])-invertFactor);
float b = abs(blue(pixels[i])-invertFactor);
// put pixel back together
pixels[i] = color(r, g, b);
// each row interval decrements invertFactor
if (i>0 && i% width==0){
invertFactor-=(255.0/height);
}
}
updatePixels();