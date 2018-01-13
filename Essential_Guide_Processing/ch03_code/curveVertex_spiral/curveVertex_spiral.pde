/**
 * curveVertex() spiral
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

int ptCount = 4;
int spiralRots = 32;
float spiralTightness = .979;
PVector[] vecs = new PVector[ptCount*spiralRots];

void setup(){
  size(400, 400);
  smooth();
  noFill();
  strokeWeight(2);
  curveTightness(-.7);
  translate(width/2, height/2);
  calcCurve(200);
  drawCurve();
  drawVecs();
}

void calcCurve(float radius){
  float px=0, py=0, theta=0;
  for (int i=0; i<vecs.length; i++){
    px = cos(theta)*radius;
    py = sin(theta)*radius;
    vecs[i] = new PVector(px, py);
    theta+=TWO_PI/ptCount;
    // slowly shrink radius to create spiral
    radius *= spiralTightness;
  }
}

void drawCurve(){
  beginShape();
  for (int i=0; i<vecs.length; i++){
    curveVertex(vecs[i].x, vecs[i].y);
  }
  endShape();
}

void drawVecs(){
  fill(255);
  strokeWeight(1);
  for (int i=1; i<vecs.length; i++){
    ellipse(vecs[i].x, vecs[i].y, 4, 4);
  }
}








