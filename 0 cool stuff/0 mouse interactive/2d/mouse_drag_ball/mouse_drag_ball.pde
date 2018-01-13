/*
 Tether Ball
 Ira Greenberg, October 11, 2005
 */
 
float nodeWidth, nodeHeight;
Node n1;

//flags control dragging/springing
boolean isDragable = false;
boolean isSpringable = false;
float ang;
float drag;
float springX;
float springY;
float springSpeed;
int nodeCol;

void setup(){
  size(500, 500);
  background(0);
  noStroke();
  nodeWidth = 40.0;
  nodeHeight = 40.0;
  ang = 0;
  drag = .90;
  springSpeed = 50; 
  nodeCol = 100;
  n1 = new Node(width/2, height/2, nodeWidth, nodeHeight);
  frameRate(30);
}

void draw(){
  if(isDragable){
    background(0);
    n1.x= mouseX;
    n1.y= mouseY;
    n1.moveNode(mouseX, mouseY);
  }

  if(isSpringable){
    background(0);
    float px;
    float py;
    px = width/2+cos(radians(ang))*springX;
    py = height/2+cos(radians(ang))*springY;
    n1.moveNode(px, py);
    springX*=drag;
    springY*=drag;
    n1.x = px;
    n1.y = py;
    ang+=springSpeed;
    if (abs(springX)<.2){
      nodeCol = 100;
    }
  }
}


// creates a hand cursor if over ball
void mouseMoved() {
  if (mouseX>=n1.x-n1.w/2 && mouseX<=n1.x+n1.w/2 &&
    mouseY>=n1.y-n1.h/2 && mouseY<=n1.y+n1.h/2 ){
    cursor(HAND); 
  } 
  else { 
    cursor(ARROW); 
  }
}

void mousePressed() {
  if (mouseX>=n1.x-n1.w/2 && mouseX<=n1.x+n1.w/2 &&
    mouseY>=n1.y-n1.h/2 && mouseY<=n1.y+n1.h/2 ){
    isSpringable = false;
    isDragable = true;
    ang = 0;
    nodeCol = 255;
  }
}  

void mouseReleased() {
  cursor(ARROW);
  isDragable = false;
  springX = n1.x-width/2;
  springY = n1.y-height/2;
  isSpringable = true;
}  


class Node {
  float x, y, w, h;
  public Node(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    drawNode(x, y, w, h);
  }
  void drawNode(float x, float y, float w, float h){
    fill(nodeCol);
    stroke(175);
    line(width/2, 0, x, y);
    stroke(nodeCol);
    ellipse(x, y, w, h);
    stroke(175);
    line(x, y+h/2, width/2, height);

  }
  void moveNode(float x, float y){
    fill(nodeCol);
    stroke(175);
    line(width/2, 0, x, y);
    stroke(nodeCol);
    ellipse(x, y, w, h);
    stroke(175);
    line(x, y+h/2, width/2, height);
  }
}