void setup(){
size(400, 400, P3D);
}
void draw(){
background(0);
translate(width/2, height/2);
rotateY(frameCount*PI/60);
box(150, 150, 150);
}