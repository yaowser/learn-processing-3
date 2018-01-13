/**
 * Data Visualizer-Stage 6
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
  VizObj[] nodes = new Icosahedron[6];
  VizObj[] bonds = new Cylinder[nodes.length];

  // Main central block
  VizObj hub = new Block(this, 80);
  hub.initRGB(160, 80, 30);
  ia.addTo(hub);
  hub.setMouseEnabled(true);

  float theta = 0.0;
  float rotVal = PI/2;
  for (int i=0; i<nodes.length; i++){
    // connecting bonds between block and icosahedron nodes
    bonds[i] = new Cylinder(this, 14, 210, 18);
    // icosahedra
    nodes[i] = new Icosahedron(this, 68);
    bonds[i].initRGB(120, 120, 120); 
    nodes[i].initRGB(int(random(255)), int(random(255)), int(random(255)));
    // shift bonds to edge of block
    PVector bondShift = new PVector(0, bonds[i].h/2+hub.radius, 0);
    bonds[i].setLoc(bondShift);
    // move node to end of each bond
    nodes[i].setLoc(bonds[i].getJoint());
    // rotate bonds and nodes around block
    if (i<4){
      bonds[i].setRot(new PVector(theta, 0, 0));
      nodes[i].setRot(new PVector(theta, 0, 0));
      theta += rotVal;
    } 
    else {
      theta = 0;
      theta += rotVal;
      bonds[i].setRot(new PVector(0, 0, theta));
      nodes[i].setRot(new PVector(0, 0, theta));
      rotVal *= 3;
    }
    nodes[i].setMouseEnabled(true);

    ia.addTo(bonds[i]);
    ia.addTo(nodes[i]);
  }
  noStroke();
}

void draw() {
  background(75);
  translate(width/2, height/2, -100);
  lights();
  ia.run();
}






























