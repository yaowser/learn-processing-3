/**
 * spiral spin
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

int ptCount = 4;
int spiralRots = 32;
float spiralTightness = .979;
Point[] pts = new Point[ptCount*spiralRots];
float drawRate = 0.0;

void setup(){
  size(400, 400);
  smooth();
  strokeWeight(2);
  curveTightness(-.7);
}

void draw(){
  background(255);
  noFill();
  translate(width/2, height/2);
  rotate(-frameCount*PI/180);
  calcCurve(200);
  drawCurve(.2);
 // drawPts();
}

void calcCurve(float radius){
  float px=0, py=0, theta=0;
  for (int i=0; i<pts.length; i++){
    px = cos(theta)*radius;
    py = sin(theta)*radius;
    pts[i] = new Point(px, py);
    theta+=TWO_PI/ptCount;
    // slowly shrink radius to create spiral
    radius *= spiralTightness;
  }
}

void drawCurve(float rate){
  beginShape();
  for (int i=0; i<drawRate; i++){
    curveVertex(pts[i].x, pts[i].y);
  }
  endShape();
  if (drawRate<pts.length-1){
    drawRate+=rate;
  }
}

void drawPts(){
  fill(255);
  strokeWeight(1);
  for (int i=1; i<pts.length; i++){
    ellipse(pts[i].x, pts[i].y, 4, 4);
  }
}

class Point{
  float x, y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
}


