/**
 * Data Visualizer-Stage 5
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
  Icosahedron icos = new Icosahedron(this, 225);
  icos.initRGB(45, 117, 130);
  icos.setMouseEnabled(true);
  ia.addTo(icos);
  noStroke();
}

void draw() {
  background(75);
  translate(width/2, height/2, -100);
  lights();
  ia.run();
}

















