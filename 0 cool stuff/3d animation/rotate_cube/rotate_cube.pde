void setup(){
size(400, 400, P3D);
}
void draw(){
background(150);
translate(width/2, height/2, 200);
rotateX(PI*frameCount/60);
rotateY(PI*frameCount/80);
rotateZ(PI*frameCount/100);
box(50, 50, 50);
}