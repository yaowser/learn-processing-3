PVector spd = new PVector(.2, .4);
PVector pos = new PVector(100,100);
void setup(){
  size(800,600);
}
  
void draw() {
  background(255);
  ellipse(pos.x, pos.y, 10, 10);
  pos.add(spd);
}
  