/**
 * Running Amuck, stage 01B
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

void setup(){
  size(600, 400);
  background(0);
  noStroke();
  translate(width/2, height/2); 
  Legs legs = new Legs(random(20, 300), random(60, 200), 
        color(random(255), random(255), random(255)));
  legs.create();
}

