/**
 * curve() circle
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

float x, y;
Point[] pts = new Point[6];

void setup(){
  size(400, 400);
  smooth();
  noFill();
  strokeWeight(4);
  // controls survature of spline
  curveTightness(5);
  translate(200, height/2);
  calcCircle(125);
  drawCircle();
  drawPts();
}

void calcCircle(float radius){
  float px=0, py=0, theta=0;
  for (int i=0; i<4; i++){
    px = cos(theta)*radius;
    py = sin(theta)*radius;
    pts[i] = new Point(px, py);
    theta+=TWO_PI/4;
  }
}

void drawCircle(){
  // the loooong hand way
  curve(pts[3].x, pts[3].y, pts[0].x, pts[0].y, pts[1].x, pts[1].y, pts[2].x, pts[2].y);
  curve(pts[0].x, pts[0].y, pts[1].x, pts[1].y, pts[2].x, pts[2].y, pts[3].x, pts[3].y);
  curve(pts[1].x, pts[1].y, pts[2].x, pts[2].y, pts[3].x, pts[3].y, pts[0].x, pts[0].y);
  curve(pts[2].x, pts[2].y, pts[3].x, pts[3].y, pts[0].x, pts[0].y, pts[1].x, pts[1].y);
}

void drawPts(){
  fill(255);
  strokeWeight(1);
  for (int i=0; i<4; i++){
    ellipse(pts[i].x, pts[i].y, 8, 8);
  }
}

class Point{
  float x, y;
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
}




