/**
 * Data Visualizer-Stage 2
 * Main Processing Tab
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.opengl.*;

Block cube;

void setup(){
  size(600, 600, OPENGL);
  cube = new Block(this, 225);
  fill(45, 100, 127);
  noStroke();
}

void draw() {
  background(75);
  lights();
  translate(width/2, height/2, -100);
  rotateX(frameCount*PI/360);
  rotateY(radians(mouseX));
  cube.create();
}














































































