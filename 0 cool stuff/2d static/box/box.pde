void setup(){
size(400, 400);
background(255);
for (int i=0; i<100; i++){
drawRectangle(random(width), random(height), random(200), random(200));
}
}
void drawRectangle(float x, float y, float w, float h){
rect(x, y, w, h);
}