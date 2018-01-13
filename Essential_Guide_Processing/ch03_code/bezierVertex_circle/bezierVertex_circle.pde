/**
 * bezierVertex() circle 
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

int detail = 4;
PVector[] anchors = new PVector[detail];
PVector[] controlsRt = new PVector[detail];
PVector[] controlsLft = new PVector[detail];

void setup(){
  size(400, 400);
  background(200);
  translate(width/2, height/2);
  smooth();
  noFill();
  strokeWeight(3);
  rectMode(CENTER);
  calcCircle(150);
  drawCircle();
  showControls();
}

void calcCircle(float radius){
  /* cubic curve internal implementation
   only requires 4 anchor PVectors for circle*/

  // spacing of anchor PVectors
  float anchorTheta = 0;
  // spacing of control PVectors
  float controlTheta = TWO_PI/detail/3;
  // distance of control PVectors
  float controlRadius = radius/cos(controlTheta);
  // for anchors
  float px = 0;
  float py = 0;
  //for controls
  float cx1 = 0;
  float cy1 = 0;
  float cx2 = 0;
  float cy2 = 0;
  for (int i=0; i<detail; i++){
    // anchor PVectors
    px = cos(anchorTheta)*radius;
    py = sin(anchorTheta)*radius;
    anchors[i] = new PVector(px, py);

    // control PVectors
    cx1 = cos(anchorTheta+controlTheta)*controlRadius;
    cy1 = sin(anchorTheta+controlTheta)*controlRadius;
    controlsLft[i] = new PVector(cx1, cy1);
    cx2 = cos(anchorTheta+controlTheta*2)*controlRadius;
    cy2 = sin(anchorTheta+controlTheta*2)*controlRadius;
    controlsRt[i] = new PVector(cx2, cy2);
    // increment theta
    anchorTheta += TWO_PI/detail;
  }
}

void drawCircle(){
  beginShape();
  vertex(anchors[0].x, anchors[0].y);
  for (int i=0; i<detail; i++){
    if (i<detail-1){
      bezierVertex(controlsLft[i].x, controlsLft[i].y, controlsRt[i].x, controlsRt[i].y, anchors[i+1].x, anchors[i+1].y);
    } 
    else {
      // close circle
      bezierVertex(controlsLft[i].x, controlsLft[i].y, controlsRt[i].x, controlsRt[i].y, anchors[0].x, anchors[0].y);
    }
  }
  endShape();
}

void showControls(){
  strokeWeight(1);
  fill(255);
  for (int i=0; i<detail; i++){
    line(controlsLft[i].x, controlsLft[i].y, anchors[i].x, anchors[i].y);
    if (i<detail-1){
      line(controlsRt[i].x, controlsRt[i].y, anchors[i+1].x, anchors[i+1].y);
    } 
    else if (i==detail-1){
      line(controlsRt[i].x, controlsRt[i].y, anchors[0].x, anchors[0].y);
    }
  }
 // ensure lines stay underneath anchors/controls 
  for (int i=0; i<detail; i++){
    // anchor PVectors and control handles
    ellipse(controlsLft[i].x, controlsLft[i].y, 8, 8);
    ellipse(controlsRt[i].x, controlsRt[i].y, 8, 8);
    rect(anchors[i].x, anchors[i].y, 8, 8);
  } 
}

