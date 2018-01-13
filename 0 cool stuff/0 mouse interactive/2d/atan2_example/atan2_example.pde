/**
 * atan2() Example
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

float theta = 0.0, radius = 20.0, offset = 0.0;
PVector[] tri = new PVector[3];

void setup(){
  size(400, 400);
  background(255);
  smooth();
  for (int i=0; i<tri.length; i++){
    if (i==0){
      offset = 80.0;
    } 
    else { 
      offset = 0.0;
    }
    tri[i] = new PVector(cos(theta)*(radius+offset), sin(theta)*(radius+offset));
    theta += PI/1.5;
  }
}

void draw(){
  fill(255, 32);
  rect(-1, -1, width+1, height+1);
  fill(165);
  translate(width/2, height/2);
  rotate(atan2(mouseY - height/2, mouseX - width/2));
  beginShape();
  for (int i=0; i<tri.length; i++){
    vertex(tri[i].x, tri[i].y);
  }
  endShape(CLOSE);
}




