/**
 * requestImage() example
 * Requires: trinity.jpg 
 * in the data directory.
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

PImage img;

void setup(){
  size(600, 450);
  img = requestImage("trinity.jpg");
}

void draw(){
  if (img.width > 0){
    image(img, 0, 0);
  }
}


