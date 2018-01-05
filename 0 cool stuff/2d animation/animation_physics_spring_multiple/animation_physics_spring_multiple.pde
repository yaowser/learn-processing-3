// Weights on Springs
int weights = 5;
float[]x = new float[weights];
float[]y = new float[weights];
float[]w = new float[weights];
float[]h = new float[weights];
float[]angle = new float[weights];
float[]frequency = new float[weights];
float[]amplitude = new float[weights];
float[]strokeWt = new float[weights];
float[]damping = new float[weights];
int springSegments = 24, springWidth = 8;
void setup(){
size(600, 400);
frameRate(30);
smooth();
fill(0);
setSpring();
}
void draw(){
background(255);
for (int i=0; i<weights; i++){
createSpring(x[i], y[i], w[i], h[i], strokeWt[i]);
noStroke();
fill(0);
// draw weights
quad(x[i], y[i], x[i]+w[i], y[i], x[i]+w[i]+w[i]*.2, 
y[i]+h[i], x[i]-w[i]*.2, y[i]+h[i]);
// spring behavior
y[i] = y[i]+cos(radians(angle[i]))*amplitude[i];
angle[i]+=frequency[i];
amplitude[i]*=damping[i];
}
// press the mouse to reset
if (mousePressed){
setSpring();
}
}
void setSpring(){
for (int i=0; i<weights; i++){
// size approximates mass
w[i] = random(20, 70);
h[i] = w[i];
// stroke weight approximates
// spring strength (resistance)
strokeWt[i] = random(1, 4);
x[i] = ((width/(weights+1))*i)+width/(weights+1)-w[i]/2.0;
y[i] = (w[i]*3)/strokeWt[i];
angle[i] = 0;
// spring speed
frequency[i] = strokeWt[i]*4;
// amplitude based on mass/spring strength
amplitude[i] = (w[i]*1.5)/strokeWt[i];
// calc. damping based on strokeWeight
// simulates resistance of spring thickness
switch(round(strokeWt[i])){
case 1:
damping[i] = .99;
break;
case 2:
damping[i] = .98;
break;
case 3:
damping[i] = .97;
break;
case 4:
damping[i] = .96;
break;
}
}
}
//plot spring
void createSpring(float x, float y, float w, float h, float strokeWt){
stroke(50);
strokeWeight(strokeWt);
for (int i=0; i<springSegments; i++){
// for spring end segment
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