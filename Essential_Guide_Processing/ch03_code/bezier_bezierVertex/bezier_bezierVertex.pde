/**
 * bezier() | bezierVertex(), 
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */
void setup(){
  size(600, 300);
  background(255);
  smooth();
  
  /*I used Processing PVector class
   for holding x,y coords*/
  //for bezier()
  PVector vec1 = new PVector(100, 250);
  PVector vec2 = new PVector(50, 50);
  PVector vec3 = new PVector(250, 50);
  PVector vec4 = new PVector(200, 250);

  //for bezierVertex()
  PVector vec5 = new PVector(400, 250);
  PVector vec6 = new PVector(350, 50);
  PVector vec7 = new PVector(550, 50);
  PVector vec8 = new PVector(500, 250);

  //plot curve using bezier()
  stroke(0);
  strokeWeight(3);
  bezier(vec1.x, vec1.y, vec2.x, vec2.y, vec3.x, vec3.y, vec4.x, vec4.y);
  //draw control PVectors connected to anchor PVectors
  stroke(150);
  strokeWeight(1);
  line(vec1.x, vec1.y, vec2.x, vec2.y);
  line(vec3.x, vec3.y, vec4.x, vec4.y);
  //control PVectors
  ellipse(vec2.x, vec2.y, 10, 10);
  ellipse(vec3.x, vec3.y, 10, 10);
  //anchor PVectors
  rectMode(CENTER);
  rect(vec1.x, vec1.y, 10, 10);
  rect(vec4.x, vec4.y, 10, 10);

  //plot curve using bezierVertex()
  stroke(0);
  strokeWeight(3);
  beginShape();
  vertex(vec5.x, vec5.y);
  bezierVertex(vec6.x, vec6.y, vec7.x, vec7.y, vec8.x, vec8.y);
  endShape();
  //draw control PVectors connected to anchor PVectors
  stroke(150);
  strokeWeight(1);
  line(vec5.x, vec5.y, vec6.x, vec6.y);
  line(vec7.x, vec7.y, vec8.x, vec8.y);
  //control PVectors
  ellipse(vec6.x, vec6.y, 10, 10);
  ellipse(vec7.x, vec7.y, 10, 10);
  //anchor PVectors
  rectMode(CENTER);
  rect(vec5.x, vec5.y, 10, 10);
  rect(vec8.x, vec8.y, 10, 10);
}



