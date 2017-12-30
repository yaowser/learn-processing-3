void setup(){
size(400, 400, P3D);
}
void draw(){
background(0);
// the next 2 lines should be switched in order
rotate(frameCount*PI/60);
translate(width/2, height/2);
sphere(100);
}