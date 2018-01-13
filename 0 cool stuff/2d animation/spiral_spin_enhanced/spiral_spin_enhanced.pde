/**
 * spiral spin enhanced
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

// points per rotation
int ptCount = 12;
// number of rotations
int spiralRots = 6;
// controls spiral coiling
float spiralTightness = .955;

PVector[] vecs = new PVector[ptCount*spiralRots];
float[] strokeCols = new float[ptCount*spiralRots];
float[] strokeWts = new float[ptCount*spiralRots];
// inital stroke weight of line
float startWt = 40.0;
// used to draw spiral over time
float drawRate = 0.0;
// actual speed to draw spiral (.1 - 2)
float drawSpeed = .75;

void setup(){
  size(400, 400);
  smooth();
  strokeWeight(startWt);
  // controls curvature of individual segments
  curveTightness(-.1);
  // generate sprial geometry.
  calcCurve(320);
}

void draw(){
  noStroke();
  fill(250, 30);
  rect(-1, -1, width, height);
  translate(width/2, height/2);
  rotate(frameCount*PI/150);
  drawCurve(drawSpeed);
  // drawVecs();
}

void calcCurve(float radius){
  float px=0, py=0, theta=0;
  // for colors and weights
  float colRatio = 255.0/(strokeCols.length-10);
  float wtRatio = startWt/(strokeWts.length-25);
  for (int i=0; i<vecs.length; i++){
    // draw spiral
    px = cos(theta)*radius;
    py = sin(theta)*radius;
    vecs[i] = new PVector(px, py);
    theta+=TWO_PI/ptCount;
    // slowly shrink radius to create spiral
    radius *= spiralTightness;
    // fill color and weight arrays
    strokeCols[i] = colRatio*i;
    strokeWts[i] = startWt-wtRatio*i;
  }
}

void drawCurve(float rate){
  for (int i=0; i<drawRate; i++){
    stroke(max(0,strokeCols[i]));
    strokeWeight(max(0,strokeWts[i]));
    curve(vecs[i].x, vecs[i].y, vecs[i+1].x, vecs[i+1].y, vecs[i+2].x, vecs[i+2].y, vecs[i+3].x, vecs[i+3].y);
  }
  // draw spiral over time
  if (drawRate<vecs.length-4){
    drawRate+=min(2, rate);
  }
}

void drawVecs(){
  fill(255);
  strokeWeight(1);
  for (int i=1; i<vecs.length; i++){
    ellipse(vecs[i].x, vecs[i].y, 4, 4);
  }
}
