// Weight on a Spring
float x, y;
int w = 150, h = 100;
float angle, frequency = 5.0;
float amplitude, damping = .987;
int springSegments = 32, springWidth = 15;
void setup(){
size(400, 400);
x = width/2.0-w/2.0;
smooth();
strokeWeight(5);
fill(0);
setSpring();
}
void draw(){
background(255);
createSpring();
startSpring();
}
void startSpring(){
// spring behavior
y += cos(radians(angle))*amplitude;
amplitude*=damping;
angle+=frequency;
if (mousePressed){
setSpring();
}
}
void setSpring(){
y = 100;
angle = 0;
amplitude = 26.0;
}
void createSpring(){
// weight
quad(x+20, y, x+w-20, y, x+w, y+h, x, y+h);
// spring
for (int i=0; i<springSegments; i++){
// end segment
if (i==springSegments-1){
line(x+w/2+springWidth, (y/springSegments)*i, 
x+w/2, (y/springSegments)*(i+1));
}
else {
// alternate spring bend left/right
if (i%2==0){
line(x+w/2-springWidth, (y/springSegments)*i, 
x+w/2+springWidth, (y/springSegments)*(i+1));
}
else {
line(x+w/2+springWidth, (y/springSegments)*i, 
x+w/2-springWidth, (y/springSegments)*(i+1));
}
}
}
}