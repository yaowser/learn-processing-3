/**
 * curve() circle
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

float x, y;
PVector[] vecs = new PVector[4];

void setup(){
  size(300, 300);
  smooth();
  noFill();
  strokeWeight(4);
  // controls survature of spline
  curveTightness(-.7);
  translate(150, height/2);
  calcCircle(125);
  drawCircle();
  drawVecs();
}

void calcCircle(float radius){
  float px=0, py=0, theta=0;
  for (int i=0; i<4; i++){
    px = cos(theta)*radius;
    py = sin(theta)*radius;
    vecs[i] = new PVector(px, py);
    theta+=TWO_PI/4;
  }
}

void drawCircle(){
  // the loooong hand way
  curve(vecs[3].x, vecs[3].y, vecs[0].x, vecs[0].y, vecs[1].x, vecs[1].y, vecs[2].x, vecs[2].y);
  curve(vecs[0].x, vecs[0].y, vecs[1].x, vecs[1].y, vecs[2].x, vecs[2].y, vecs[3].x, vecs[3].y);
  curve(vecs[1].x, vecs[1].y, vecs[2].x, vecs[2].y, vecs[3].x, vecs[3].y, vecs[0].x, vecs[0].y);
  curve(vecs[2].x, vecs[2].y, vecs[3].x, vecs[3].y, vecs[0].x, vecs[0].y, vecs[1].x, vecs[1].y);
}

void drawVecs(){
  fill(255);
  strokeWeight(1);
  for (int i=0; i<4; i++){
    ellipse(vecs[i].x, vecs[i].y, 8, 8);
  }
}



