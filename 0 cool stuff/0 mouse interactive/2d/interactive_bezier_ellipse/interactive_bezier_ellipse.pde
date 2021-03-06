
/* 
 Interactive Bezier Ellipse
 Ira Greenberg, December 19, 2005
 Revised, November 15, 2006
 *********************************
 NOTES:
 *********************************
 This example requires the font 
 "Verdana-48.vlw" to be installed in 
 the sketch directory's data folder. 
 You can create a vlw format font by 
 selecting the "create Font..." command 
 from the Tools menu. If you prefer to 
 use another typeface, make sure you 
 update the line: 
 font = loadFont("Verdana-48.vlw");
 with the exact new font name, or your 
 program will not run properly.
 *********************************/

// used for curve plotting
int points = 4; // any positive integer
float radius = 130; // any value
int initPoints = points;
float controlRadius = radius;
float[]px = new float[points];
float[]py = new float[points];
float[]cx = new float[points];
float[]cy = new float[points];
float[]cx2 = new float[points];
float[]cy2 = new float[points]; 
float angle = 360.0/points;
float controlAngle1 = angle/3.0;
float controlAngle2 = controlAngle1*2.0;

// used to hold original point info needed for reset function
float[][]initNodes = {
  new float[points], new float[points], new float[points], 
  new float[points], new float[points], new float[points]};

// used for ineraction control 
int node = -1;
int nodeIndex = -1;
boolean isNodesVisible = true;
boolean isDragSafe = false;
boolean isSliderDraggable = false;
boolean isSliderDraggable2 = false;

// used for control Radius slider
int[]handle;
int[]bar;

//used for points slider
int[]handle2;
int[]bar2;

// gui stuff (labels, buttons, slliders)
float labelWidth=0;
PFont font;
color resetCol = #000000;
color randomizeCol = #000000;
color randHandCol = #000000;
color pntsHandCol = #000000;
color controlPtCol = #222222;
color anchorPtCol = #BBBBBB;
color hideNodesCol = #EEEEEE;
float[]curveResetBtn;
float[]curveRandomizeBtn;
float[]hideNodesBtn;
String nodesHideLabel = "Hide Nodes";
int btnPadding;
float btnBaseline;

void setup(){
  size(600, 600);
  

  // for layout
  btnPadding = width/6;
  //Control Radius handle and bar
  bar = new int[]{
    width-btnPadding-100, height-32, 
    width-btnPadding, height-32        };
  handle = new int[]{
    bar[0]+(bar[2]-bar[0])/2, bar[1], 6, 6        };

  //points handle and bar
  bar2 = new int[]{
    width-(btnPadding*2+25)-100, height-32, 
    width-(btnPadding*2+25), height-32        };
  handle2 = new int[]{
    bar2[0], bar2[1], 6, 6        };

  // for layout
  btnBaseline =  height-(height-bar[1])/1.5; 

  // fill arrays with ellipse data
  for ( int i=0; i< points; i++){
    initNodes[0][i] = px[i] = width/2+cos(radians(angle))*radius;
    initNodes[1][i] = py[i] = height/2+sin(radians(angle))*radius;
    initNodes[2][i] = cx[i] = width/2+cos(radians(angle+controlAngle1))*controlRadius/cos(radians(controlAngle1));
    initNodes[3][i] = cy[i] = height/2+sin(radians(angle+controlAngle1))*controlRadius/cos(radians(controlAngle1));
    initNodes[4][i] = cx2[i] = width/2+cos(radians(angle+controlAngle2))*controlRadius/cos(radians(controlAngle1));
    initNodes[5][i] = cy2[i] = height/2+sin(radians(angle+controlAngle2))*controlRadius/cos(radians(controlAngle1));

    //increment angle so trig functions keep chugging along
    angle+=360.0/points;
  }
}

void draw(){
  background(145);

  // create curves
  strokeWeight(1.125);
  stroke(255);
  noFill();
  for (int i=0; i<points; i++){
    if (i==points-1) {
      bezier(px[i], py[i], cx[i], cy[i], cx2[i], cy2[i],  px[0], py[0]);
    }
    else{  
      bezier(px[i], py[i], cx[i], cy[i], cx2[i], cy2[i],  px[i+1], py[i+1]);
    }
  }
  strokeWeight(.75);
  stroke(0);
  rectMode(CENTER);

  //check nodes visibility state
  if (isNodesVisible){
    for ( int i=0; i< points; i++){
      // control handles and tangent lines
      if (i==points-1){  // last loop iteration-close path
        line(px[0], py[0], cx2[i], cy2[i]);
      } 
      if (i>0){
        line(px[i], py[i], cx2[i-1], cy2[i-1]);
      }
      line(px[i], py[i], cx[i], cy[i]);
    }

    for ( int i=0; i< points; i++){
      fill(controlPtCol);
      noStroke();
      //control handles
      ellipse(cx[i], cy[i], 8, 8);
      ellipse(cx2[i], cy2[i], 8, 8);

      fill(anchorPtCol);
      stroke(0);
      //anchor points
      rect(px[i], py[i], 10, 10);
    }
  }

  // nodeIndex is set on press, if over a node
  // nodeIndex will be an integer value representing
  // the node to drag. 
  switch(node){
  case 0:
    px[nodeIndex] = mouseX;
    py[nodeIndex] = mouseY;
    break;
  case 1:
    cx[nodeIndex] = mouseX;
    cy[nodeIndex] = mouseY;
    break;
  case 2:
    cx2[nodeIndex] = mouseX;
    cy2[nodeIndex] = mouseY;
    break;
  }

  // call function to calculate control radius based 
  // on Control Radius slider handle x position
  setControlRadius();

  if (isSliderDraggable){
    // if mouse is between Control Radius slide bar 
    // terminal points, start drag
    if (mouseX>bar[0] && mouseX<bar[2]){
      handle[0] = mouseX;
      shapeCurve();
    }
  }

  if (isSliderDraggable2){
    // if mouse is between Points slide bar 
    // terminal points, start drag
    if (mouseX>bar2[0] && mouseX<bar2[2]){
      handle2[0] = mouseX;
    }
  }

  //Radius control slider
  strokeWeight(1.5);
  stroke(100);
  line(bar[0], bar[1], bar[2], bar[3]);
  fill(randHandCol);
  strokeWeight(.75);
  rect(handle[0], handle[1], handle[2], handle[3]);

  //Points slider
  strokeWeight(1.5);
  stroke(100);
  line(bar2[0], bar2[1], bar2[2], bar2[3]);
  fill(pntsHandCol);
  strokeWeight(.75);
  rect(handle2[0], handle2[1], handle2[2], handle2[3]);

  //Title label
  fill(255);
  String label = "Bezier Ellipse";
  
  labelWidth = textWidth(label);
  text(label, width/2-labelWidth/2, 50);

  //Control Radius slider label
  fill(0);
  label = "Control Radius";
  
  labelWidth = textWidth(label);
  fill(0);
  text(label, (bar[0]+bar[2])/2-labelWidth/2, btnBaseline+5);

  //Points slider label
  fill(0);
  label = "Points";
  
  labelWidth = textWidth(label);
  fill(0);
  text(label, (bar2[0]+bar2[2])/2-labelWidth/2, btnBaseline+5);

  //reset button
  label = "Reset";
  
  labelWidth = textWidth(label);
  fill(resetCol);
  text(label, btnPadding-labelWidth/2, btnBaseline);
  stroke(resetCol);
  line(btnPadding-labelWidth/2, btnBaseline+3, btnPadding-labelWidth/2+labelWidth, btnBaseline+3);
  curveResetBtn = new float[]{
    btnPadding-labelWidth/2, btnBaseline, labelWidth, 12        };

  //randomize button
  label = "Randomize";
  
  labelWidth = textWidth(label);
  fill(randomizeCol);
  text(label, btnPadding*2-labelWidth/2, btnBaseline);
  stroke(randomizeCol);
  line(btnPadding*2-labelWidth/2, btnBaseline+3, btnPadding*2-labelWidth/2+labelWidth, btnBaseline+3);
  curveRandomizeBtn = new float[]{
    btnPadding*2-labelWidth/2, btnBaseline, labelWidth, 12        };

  //show/hide nodes button
  label = nodesHideLabel;
  
  labelWidth = textWidth(nodesHideLabel);
  fill(hideNodesCol);
  text(nodesHideLabel, width-60, 15);
  stroke(hideNodesCol);
  line(width-60, 18, width-60+labelWidth, 18);
  hideNodesBtn = new float[]{
    width-60, 18, width-60+labelWidth, 18        };
}

// event behavior
void mouseReleased(){
  // reset detection flags
  node = -1;
  isSliderDraggable = false;
  isSliderDraggable2 = false;
}

void mousePressed(){
  //check for press on anchor/control points
  for ( int i=0; i< points; i++){
    if (mouseX>= px[i]-4 && mouseX <=  px[i] +4 &&
      mouseY>=  py[i]-4 && mouseY <  py[i] +4){
      node = 0;
      nodeIndex = i;
    } 
    else if (mouseX>= cx[i]-4 && mouseX <=  cx[i] +4 &&
      mouseY>=  cy[i]-4 && mouseY <  cy[i] +4){
      node = 1;
      nodeIndex = i;
    } 
    else if (mouseX>= cx2[i]-4 && mouseX <=  cx2[i] +4 &&
      mouseY>=  cy2[i]-4 && mouseY <  cy2[i] +4){
      node = 2;
      nodeIndex = i;
    } 

  }
  // check for press on Control Radius slider handle
  if (mouseX>=handle[0]-4 && mouseX <= handle[0] +4 &&
    mouseY>=handle[1]-4 && mouseY < handle[1] +4){
    isSliderDraggable = true;
  }

  // check for press on Points slider handle
  if (mouseX>=handle2[0]-4 && mouseX <= handle2[0] +4 &&
    mouseY>=handle2[1]-4 && mouseY < handle2[1] +4){
    isSliderDraggable2 = true;
    setPoints();
  }

  // check for press on reset buttons
  if (mouseX>=curveResetBtn[0] && mouseX <= curveResetBtn[0]+curveResetBtn[2] &&
    mouseY>= curveResetBtn[1]-curveResetBtn[3] && mouseY < curveResetBtn[1]+curveResetBtn[3]){
    resetCurve();
  }

  // check for press on  randomization buttons
  if (mouseX>=curveRandomizeBtn[0] && mouseX <= curveRandomizeBtn[0]+curveRandomizeBtn[2] &&
    mouseY>= curveRandomizeBtn[1]-curveRandomizeBtn[3] && mouseY < curveRandomizeBtn[1]+curveRandomizeBtn[3]){
    randomizeCurveControls();
  }

  // check for press on nodes button
  if (mouseX>=hideNodesBtn[0] && mouseX <= hideNodesBtn[0]+hideNodesBtn[2] &&
    mouseY>= hideNodesBtn[1]-hideNodesBtn[3] && mouseY < hideNodesBtn[1]+hideNodesBtn[3]){

    //toggle hide/show nodes button
    if (isNodesVisible){
      isNodesVisible = false;
      nodesHideLabel = "Show Nodes";
    } 
    else {
      isNodesVisible = true;
      nodesHideLabel = "Hide Nodes";
    }
  }
}

void mouseMoved(){
  //set button default colors
resetCol = #000000;
randomizeCol = #000000;
randHandCol = #000000;
pntsHandCol = #000000;
hideNodesCol = #EEEEEE;
  cursor(ARROW);
  //check for mouse motion on anchor/control point
  for ( int i=0; i< points; i++){
    if (mouseX>= px[i]-4 && mouseX <=  px[i] +4 &&
      mouseY>=  py[i]-4 && mouseY <  py[i] +4){
      cursor(MOVE);
    } 
    else if (mouseX>= cx[i]-4 && mouseX <=  cx[i] +4 &&
      mouseY>=  cy[i]-4 && mouseY <  cy[i] +4){
      cursor(MOVE);
    } 
    else if (mouseX>= cx2[i]-4 && mouseX <=  cx2[i] +4 &&
      mouseY>=  cy2[i]-4 && mouseY <  cy2[i] +4){
      cursor(MOVE);
    } 
  }
  // check for mouse motion on radius control handle
  if (mouseX>=handle[0]-4 && mouseX <= handle[0] +4 &&
    mouseY>=handle[1]-4 && mouseY < handle[1] +4){
    cursor(MOVE);
randHandCol = #FFFFFF;
  }

  // check for mouse motion on Points handle
  if (mouseX>=handle2[0]-4 && mouseX <= handle2[0] +4 &&
    mouseY>=handle2[1]-4 && mouseY < handle2[1] +4){
    cursor(MOVE);
pntsHandCol = #FFFFFF;
  }

  // check for mouse motion on reset button
  if (mouseX>=curveResetBtn[0] && mouseX <= curveResetBtn[0]+curveResetBtn[2] &&
    mouseY>= curveResetBtn[1]-curveResetBtn[3] && mouseY < curveResetBtn[1]+curveResetBtn[3]){
    cursor(HAND);
resetCol = #FFFFFF;
  }

  // check for mouse motion on randomization button
  if (mouseX>=curveRandomizeBtn[0] && mouseX <= curveRandomizeBtn[0]+curveRandomizeBtn[2] &&
    mouseY>= curveRandomizeBtn[1]-curveRandomizeBtn[3] && mouseY < curveRandomizeBtn[1]+curveRandomizeBtn[3]){
    cursor(HAND);
randomizeCol = #FFFFFF;
  }

  // check for mouse motion on hide/show nodes button
  if (mouseX>=hideNodesBtn[0] && mouseX <= hideNodesBtn[0]+hideNodesBtn[2] &&
    mouseY>= hideNodesBtn[1]-hideNodesBtn[3] && mouseY < hideNodesBtn[1]+hideNodesBtn[3]){
hideNodesCol = #555555;
  }
}

// check for drag behavior on Points slider
void mouseDragged(){
  if (mouseX>=handle2[0]-4 && mouseX <= handle2[0] +4 &&
    mouseY>=handle2[1]-4 && mouseY < handle2[1] +4){
    cursor(MOVE);
    // calculate Points based on 
    // Points slider handle x position
    setPoints();
  }
}

void resetCurve(){
  // reset initial point count
  points = initPoints;


  // reassign arrays to initial values
  for ( int i=0; i< points; i++){
    px[i] = initNodes[0][i];
    py[i] = initNodes[1][i];
    cx[i] = initNodes[2][i];
    cy[i] = initNodes[3][i];
    cx2[i] = initNodes[4][i];
    cy2[i] = initNodes[5][i];
  }
  // reset slider handles to original positions
  handle[0] = bar[0]+(bar[2]-bar[0])/2;
  handle2[0] = bar2[0];
}

void randomizeCurveControls(){
  // place Control Radius slider handle randomly along bar
  handle[0] = int(random(bar[0], bar[2]));
  //update control radius
  setControlRadius();
  // update control handles
  shapeCurve();
}

void shapeCurve(){
  // selector generates random values which 
  // are fed into mudulus opertion, yielding
  // less predictable curve mutations
  int selector = int(random(1, 6));
  for ( int i=0; i< points; i++){
    if (i%selector==0){
      cx[i] = width/2+cos(radians(angle+controlAngle1))*controlRadius/cos(radians(controlAngle1));
      cy[i] = height/2+sin(radians(angle+controlAngle1))*controlRadius/cos(radians(controlAngle1));
      cx2[i] = width/2+cos(radians(angle+controlAngle2))*controlRadius/cos(radians(controlAngle1));
      cy2[i] = height/2+sin(radians(angle+controlAngle2))*controlRadius/cos(radians(controlAngle1));
    }
    //increment angle so trig functions keep chugging along
    angle+=360.0/points;
  }
}

void setControlRadius(){
  // remape slider handle values to give usable results
  int reMap = ((handle[0]-bar[0]) - (bar[2]-bar[0])/2);
  // negative values need to be larger than pos values
  int boost = 5;
  if (reMap<0){
    boost=12;
  }
  controlRadius = radius + reMap*boost;
}

void setPoints(){
  //remaps Points slider bar handle x values
  // to usable vlaues
  float reMap = ((handle2[0]-bar2[0]))*.5+initPoints;
  points = int(reMap);
  angle = 360.0/points;
  controlAngle1 = angle/3.0;
  controlAngle2 = controlAngle1*2.0;

  //reassign arrays with new length
  px = new float[points];
  py = new float[points];
  cx = new float[points];
  cy = new float[points];
  cx2 = new float[points];
  cy2 = new float[points]; 

  for ( int i=0; i< points; i++){
    // refill arrays with ellipse data
    px[i] = width/2+cos(radians(angle))*radius;
    py[i] = height/2+sin(radians(angle))*radius;
    cx[i] = width/2+cos(radians(angle+controlAngle1))*controlRadius/cos(radians(controlAngle1));
    cy[i] = height/2+sin(radians(angle+controlAngle1))*controlRadius/cos(radians(controlAngle1));
    cx2[i] = width/2+cos(radians(angle+controlAngle2))*controlRadius/cos(radians(controlAngle1));
    cy2[i] = height/2+sin(radians(angle+controlAngle2))*controlRadius/cos(radians(controlAngle1));

    //increment angle so trig functions keep chugging along
    angle+=360.0/points;
  }
}