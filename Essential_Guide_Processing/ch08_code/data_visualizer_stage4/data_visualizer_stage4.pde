/**
 * Data Visualizer-Stage 4
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
  int rows = 8;
  float totalHt = 375;
  float gap = totalHt/rows;
  int cubeCount = 20;
  int counter = 0;
  float ringRadius = 240;
  float theta;
  float y = -totalHt/2;
  Block[][] cubes = new Block[rows][cubeCount];
  for(int i=0; i<cubes.length; i++){
    theta = 0.0;
    for(int j=0; j<cubes[i].length; j++){
      cubes[i][j] = new Block(this, 20);
      cubes[i][j].setRot(new PVector(0, theta, 0));
      cubes[i][j].setLoc(new PVector(sin(theta)*ringRadius, y, cos(theta)*ringRadius));
      theta += TWO_PI/cubeCount;

      cubes[i][j].initRGB(int(random(200)), int(random(200)), int(random(200)));
      cubes[i][j].setMouseEnabled(true);
      cubes[i][j].setInfo("hovering over block " + counter++);
      ia.addTo(cubes[i][j]);
    }
    y+=gap;
  }
  noStroke();
}

void draw() {
  background(75);
  translate(width/2, height/2, -100);
  lights();
  ia.run();
  println(ia.getVizObjInfo());
}






















