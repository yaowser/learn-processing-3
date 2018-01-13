/**
 * Data Visualizer-Stage 7
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

  Helix helix = new Helix(this, 380, 430, 6, 144, 13, 24);
  int[] r = new int[helix.getHelixDetail()];
  int[] g = new int[helix.getHelixDetail()];
  int[] b = new int[helix.getHelixDetail()];
  for (int i=0; i<helix.getHelixDetail(); i++){
    r[i] = int(random(255));
    g[i] = int(random(255));
    b[i] = int(random(255));
  }
  helix.initRGB(r, g, b);
  ia.addTo(helix);
  noStroke();
}

void draw() {
  background(75);
  translate(width/2, height/2, -100);
  lights();
  ia.run();
}































