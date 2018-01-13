/**
 * loadImage() vs. requestImage()
 * Requires: trinity.jpg image
 * in data directory.
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

PImage img;

void setup(){
  size(600, 450);
  background(50);
}

void draw(){
  img = loadImage("trinity.jpg");
  //img = requestImage("trinity.jpg");
  println(frameRate);
}







