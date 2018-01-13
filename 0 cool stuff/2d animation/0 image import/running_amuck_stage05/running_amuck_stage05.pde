/**
 * Running Amuck, stage 05
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

PImage front, back;
int count = 50;
Neck[] necks = new Neck[count];
Legs[] legs = new Legs[count];
Schlemiel[] schlemiels = new Schlemiel[count];

void setup(){
  size(800, 500, P3D);
  noStroke();
  // images for head (same 2 for all heads)
  front = loadImage("face_front.png");
  back = loadImage("face_back.png");
  for (int i=0; i<count; i++){
    // create local Head object per neck
    Head head = new Head(front, back);
    necks[i] = new Neck(head);
    necks[i].setSegments(int(random(12, 25)));
    // legs position
    PVector legsLoc = new PVector(random(-20, 20), 10, random(-450, -200));
    legs[i] = new Legs(legsLoc, random(5, 30), random(8, 60), color(random(255), random(255), random(255)));
    legs[i].setDetails(random(legs[i].w*.05, legs[i].w*.25), random(legs[i].ht*.05, legs[i].ht*.25), random(legs[i].w*.02, legs[i].w*.15), random(legs[i].w*.1, legs[i].w*.5));
    legs[i].setStride(random(5, 12), random(PI/20, PI/10), random(.85, .95));
    legs[i].setDynamics(random(-.35, .35), random(.75, 2.5), random(.65, .95));
    // pass Neck and Leg objects to Schlemiel constructor
    schlemiels[i] = new Schlemiel(necks[i], legs[i]);
    // set z-bounds
    schlemiels[i].setMotionBounds(new PVector(0, 0, -1000), new PVector(0, 0, 600));
  }
}

void draw(){
  background(10);
  translate(width/2, height/2);
  // draw ground plane
  createGround(color(50));
  // draw the bobbling schlemiels
  for (int i=0; i<count; i++){
    schlemiels[i].create();
    schlemiels[i].move();
  }
}

// ground plane
void createGround(color col){
  fill(col);
  beginShape();
  vertex(-width*2, 20, -1000);
  vertex(width*2, 20, -1000);
  vertex(width/2, height/2, 400);
  vertex(-width/2, height/2, 400);
  endShape(CLOSE);
}











