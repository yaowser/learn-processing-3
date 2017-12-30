// sphereDetail() Example
int detail = 10;
int depth = 100;
void setup(){
size(400, 400, P3D);
}
void draw(){
background(50);
translate(width/2, height/2, depth);
rotateY(PI*frameCount/125);
lights();
fill(100, 50, 175);
stroke(150, 75, 255);
sphereDetail(detail);
sphere(20);
println(depth);
}
void keyPressed(){
if(key == CODED) {
if (keyCode == UP) {
if (depth<310){
depth+=20;
detail+=2;
}
}
else if (keyCode == DOWN) {
if (depth>70){
depth-=20;
detail-=2;
}
}
}
}