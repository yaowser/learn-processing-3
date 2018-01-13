/**
 * Data Visualizer-Stage 1
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
  translate(width/2, height/2, -100);
  rotateY(PI/8);
  rotateX(PI/8);
  lights();
  cube.create();
}














































































