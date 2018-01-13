/**
 * curveVertex() spiral
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

int ptCount = 32;
float spiralRate = 0;
int spiralRots = 8;
float spiralTightness = .991;
PVector[] vecs = new PVector[ptCount*spiralRots];
float[] wts = new float[ptCount*spiralRots];
int[] alphs = new int[ptCount*spiralRots];

void setup(){
  size(400, 400);
  smooth();
  strokeWeight(2);
  curveTightness(-.1);
  calcCurve(200);

}
void draw(){
  translate(width/2, height/2);
  noFill();

  drawCurve(.5);
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
    wts[i] = (vecs.length-i)*.1;
    alphs[i] = (255-i);
  }
}

void drawCurve(float rate){
  beginShape();
  for (int i=0; i<spiralRate; i++){
    strokeWeight(wts[i]);
    stroke(0, alphs[i]);
    curveVertex(vecs[i].x, vecs[i].y);

  }
  endShape();
  if (spiralRate<vecs.length){
    spiralRate+=rate;
  }
}

void drawVecs(){
  fill(255);
  strokeWeight(1);
  for (int i=0; i<vecs.length; i++){
    ellipse(vecs[i].x, vecs[i].y, 4, 4);
  }

}











