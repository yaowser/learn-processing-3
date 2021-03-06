// click to randomize
float x, y, squareSize;
color bgColor, strokeColor, fillColor;
float strokeWt;
void setup(){
  size(400, 400);
  rectMode(CENTER);
  x = width/2;
  y = height/2;
  setRandomStyle();
  frameRate(30);
}
void draw(){
  background(bgColor);
  strokeWeight(strokeWt);
  stroke(strokeColor);
  fill(fillColor);
  rect(x, y, squareSize, squareSize);
  if (mousePressed){
    setRandomStyle();
  }
}
void setRandomStyle(){
  bgColor = color(random(255), random(255), random(255));
  strokeColor = color(random(255), random(255), random(255));
  fillColor = color(random(255), random(255), random(255));
  strokeWt = random(5, 100);
  squareSize = random(10, 300);
}