/**
 * PImage.pixels 
 * Requires: dublin0.jpg & dublin1.jpg 
 * in the data directory.
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */
int imgCount = 2;
PImage[] imgs = new PImage[imgCount];
float sclFactor;

void setup(){
  size(600, 225);
  for (int i=0; i<imgCount; i++){
    // load images
    imgs[i] = loadImage("dublin"+i+".jpg");
  }
}

void draw(){
  for (int i=0; i<imgCount; i++){
    // scale image widths to 1/2 sketch window width
    sclFactor = width/float(imgCount)/imgs[i].width;
    // draw images
    image(imgs[i], width/float(imgCount)*i, 0, imgs[i].width*sclFactor, imgs[i].height*sclFactor);
  }
}

void mousePressed(){
  /* on mouse press toggles 
   images left and right */
  // load pixels to make available
  imgs[0].loadPixels();
  imgs[1].loadPixels();


  // swap pixels
  color[] pxls0 = imgs[0].pixels;
  imgs[0].pixels = imgs[1].pixels;
  imgs[1].pixels = pxls0;

  // update sketch window
  imgs[0].updatePixels();
  imgs[1].updatePixels();
}





