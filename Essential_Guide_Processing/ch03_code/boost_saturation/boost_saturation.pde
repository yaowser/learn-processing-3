/**
 * Boost saturation of screen pixels
 * Requires: malahide.jpg 
 * in the data directory.
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

PImage img;

void setup(){
  size(600, 450);
  img = loadImage("malahide.jpg");
  image(img, 0, 0);
  // grab all sketch window pixels
  loadPixels();
  // boost saturation
  remapSaturation(2);
  // update sketch window pixels
  updatePixels();
}

void  remapSaturation(float factor){
  colorMode(HSB, 255);
  /* remap saturation of top third 
   of sketch window pixels */
  for (int i=0; i<pixels.length/3; i++){
    // extract saturation of ech pixel
    float sat = saturation(pixels[i]);
    // boost saturation
    sat *= factor;
    // rebuild pixel
    pixels[i] = color(hue(pixels[i]), sat, brightness(pixels[i]));
  }
}

