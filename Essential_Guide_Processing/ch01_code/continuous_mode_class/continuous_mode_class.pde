/* Processing Continuous Mode 
 with Class Example */
void setup(){
  // change default size of sketch window
  size(200, 100);
  smooth();
  // procedural approach to draw the shapes
  drawShapes(25, 25, 50, 50);

  // OOP approach to draw the shapes
  RectEllipse shapes = new RectEllipse(50, 50, 30, 30);
  // move shape over
  shapes.setLoc(150, 50);
  shapes.create();
}

// function to draw shapes
void drawShapes(float x1, float y1, float x2, float y2){
  rect(x1, y1, 50, 50);
  stroke(127);
  fill(0);
  ellipse(x2, y2, 30, 30);
}

class RectEllipse{
  // properties
  float x, y;  // group position 
  float w1, h1, w2, h2; // dimensions

  // constructor
  RectEllipse(float w1, float  h1, float  w2, float  h2){
    this.w1 = w1;
    this.h1 = h1;
    this.w2 = w2;
    this.h2 = h2;
  }

  // methods
  void setLoc(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void create(){
    // draw rectangle from center point
    rectMode(CENTER);
    // make sure default paint styles reset
    stroke(0);
    fill(255);
    rect(x, y, w1, h1);
    stroke(127);
    fill(0);
    ellipse(x, y, w2, h2);
  }
}

