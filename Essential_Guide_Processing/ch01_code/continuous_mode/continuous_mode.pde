// Processing Continuous Mode Example
void setup(){
  smooth();
  drawShapes(25, 25, 50, 50);
}

void drawShapes(float x1, float y1, float x2, float y2){
  rect(x1, y1, 50, 50);
  stroke(127);
  fill(0);
  ellipse(x2, y2, 30, 30);
}

