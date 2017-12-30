// n
float x, y;
// declare and initialize radius
float r = 1.5;
float jitter = 5;
float scatter = 1;
void setup(){
size(400, 400);
// initialize x, y
x = width/2.0;
y = height/2.0;
frameRate(30);
smooth();
noStroke();
}
void draw(){
// fading background
fill(0, 5);
rect(0, 0, width, height);
fill(255);
for (int i=0; i<scatter; i++){
float angle = random(TWO_PI);
float sctterDistX = x+cos(angle)*jitter;
float sctterDistY = y+sin(angle)*jitter;
ellipse(sctterDistX, sctterDistY, r*2, r*2);
}
}
void mouseDragged() {
x = mouseX;
y = mouseY;
}
// scatter/jitter ellipse
void mouseMoved() {
scatter = mouseX*.05;
jitter = mouseY*.05;
}