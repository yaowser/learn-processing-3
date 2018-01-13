/**
 * Running Amuck, stage 03
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

Legs legs;

void setup(){
  size(600, 400);
  background(0);
  noStroke();
  legs = new Legs(150, 160, #887733);
  legs.setDetails(30, 50, 55, 75);
  legs.setStride(190, PI/30, .49);
}

void draw(){
  size(600, 400);
  background(0);
  noStroke();
  translate(width/2, height/2);
  legs.create();
  legs.stride();
  // saveFrame( "running_amok-###.jpg" );
}

