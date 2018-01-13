/**
 * Drawing mode sampler
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

void setup(){
  // set up environment
  size(400, 400);
  background(0);
  stroke(255);
  noFill();
  smooth();
  float radius = 140;
  float theta = 0;
  int[] modes = {
    POINTS, LINES, TRIANGLES, TRIANGLE_FAN, TRIANGLE_STRIP, QUADS, QUAD_STRIP};

  // drawing
  translate(width/2, height/2);
  for (int i=0; i<modes.length; i++){
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    createPoly(15, 45, 0, modes[i]);
    popMatrix();
    theta += TWO_PI/modes.length;
  }
}

