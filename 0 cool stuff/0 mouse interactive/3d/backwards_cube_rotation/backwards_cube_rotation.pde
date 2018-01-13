float rotX, rotY;
void setup(){
  size(400, 400, P3D);
}
void draw(){
  background(150);
  translate(width/2, height/2, 200);
  rotateX(rotX);
  rotateY(rotY);
  box(50, 50, 50);
}
void mouseMoved(){
  rotX = radians(mouseY);
  rotY = radians(mouseX);
}