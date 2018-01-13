/**
 * Image fan()
 * Requires: trinity.jpg image
 * in data directory.
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

PImage img;

void setup(){
  size(610, 450);
  background(50);
  img = loadImage("trinity.jpg");
  translate(width/2, height/2);
  for (int i=1; i<500; i++){
    rotate(PI/180*i);
    image(img, 0, 0, width/(i*.15), height/(i*.15));
  }
}




