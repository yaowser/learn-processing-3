/**
 * Data Visualizer-Stage 3
 * Main Processing Tab
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.opengl.*;

Interactor ia;

void setup(){
  size(600, 600, OPENGL);
  ia = new Interactor();
  Block cube = new Block(this, 225);
  cube.initRGB(45, 127, 100);
  cube.setMouseEnabled(true);
  ia.addTo(cube);
  noStroke();
}

void draw() {
  background(75);
  translate(width/2, height/2, -100);
  lights();
  ia.run();
}

















