/**
 * Running Amuck, stage 04
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

int count = 350;
Legs[] legs = new Legs[count];

void setup(){
  size(600, 400, P3D);
  noStroke();
  for (int i=0; i<count; i++){
    PVector legsLoc = new PVector(random(-20, 20), 10, random(0, 150));
    legs[i] = new Legs(legsLoc, random(.5, 5), random(1, 8), color(random(255), random(255), random(255)));
    legs[i].setDetails(random(legs[i].w*.05, legs[i].w*.25), random(legs[i].ht*.05, legs[i].ht*.25), random(legs[i].w*.02, legs[i].w*.15), random(legs[i].w*.1, legs[i].w*.5));
    legs[i].setStride(random(.5, 2), random(PI/10, PI/5), random(.85, .95));
    legs[i].setDynamics(random(-.35, .35), random(.75, 2.5), random(.65, .95));
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  fill(35);
  // draw ground plane
  beginShape();
  vertex(-width*2, 20, -1000);
  vertex(width*2, 20, -1000);
  vertex(width/2, height/2, 400);
  vertex(-width/2, height/2, 400);
  endShape(CLOSE);
  for (int i=0; i<count; i++){
    legs[i].create();
    legs[i].stride();
    // args set z bounds
    legs[i].move(-50, 400);
  }
}


