/**
 * Polygon function drawing example
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

void setup(){
  // set up environment
  size(400, 400);
  background(0);
  stroke(255, 100);
  smooth();
  float scl = 1.0;
  float sclChange = .02;
  float radius = 500;

// drawing
  translate(width/2, height/2);
  while(scl > 0){
    fill(random(255), random(255), random(255), 100);
    pushMatrix();
    scale(scl-=sclChange);
    createPoly(int(random(5, 12)), radius, 0);
    popMatrix();
  }
}

