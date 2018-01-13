// object space vs world space
float x, y, w = 120, h = 10;
void setup(){
  size(800, 400);
  smooth();
  rectMode(CENTER);
}
void draw(){
  // paint background
  fill(0, 5);
  rect(width/2-1, height/2-1, width+2, height+2);
  // divide canvas
  line(width/2, 0, width/2, height);
  stroke(255);
  fill(0);
  // rotate around object origin
  pushMatrix();
  // translate world space
  translate(width*.25, height/2);
  rotate(frameCount*PI/180);
  // center at object origin
  x = 0;
  y = 0;
  rect(x, y, w, h);
  popMatrix();
  // rotate with object offset
  pushMatrix();
  // translate world space
  translate(width*.75, height/2);
  rotate(-frameCount*PI/180);
  // offset object space by 100, 100
  x = 100;
  y = 100;
  rect(x, y, w, h);
  popMatrix();
}

