void setup(){
size(400, 100, P3D);
}
void draw(){
background(255);
translate(10, height/2);
for (int i=10; i<width-20; i+=10){
translate(10, 0);
box(10, 10, 10);
}
}