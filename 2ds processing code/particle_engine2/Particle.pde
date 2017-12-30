class Particle {
  PVector loc;
  PVector velocity;
  float scl;
  PImage p;
  String particleSpriteURL;
  Particle(){
  }
 
  Particle( PVector loc,  PVector velocity,  float scl,  String particleSpriteURL){
    this.loc = loc;
    this.scl = scl;
    this.velocity = velocity;
    p = loadImage(particleSpriteURL);
  }
 
 void move (){
  loc.add(velocity); 
 }
 
 void display() {
   pushMatrix();
   translate(loc.x, loc.y);
   scale(scl);
   if (p != null) {
     image(p,-p.width/2,-p.height/2);
   } else {
     ellipse(0,0,1,1);
   }
   popMatrix();
 }
}