/*******************************************
* Asteroid Shower
* Non-orthogonal Collision with
* Multiple Ground Segments and
* Multiple Orbs
*******************************************
* Based on Keith Peters's Solution in
* Foundation ActionScript Animation:
* Making Things Move!
* http://www.friendsofed.com/book.html? å
* isbn=1590597915
*******************************************/
// orbCount minimum is 2
int orbCount = 140;
Orb[] orb = new Orb[orbCount];
Vect2D[] velocity = new Vect2D[orbCount];
color[] cols = new color[orbCount];
float[] damping = new float[orbCount];
float gravity = .03;
float sprayRadius = .3;
float birthRate = .4;
float emitter = 0;
float dampingMin = .5, dampingMax = .85;
// min of 6 segments required
int segments = 200;
Ground[] ground = new Ground[segments];
float[] peakHeights = new float[segments+1];
// controls ground undulation
float groundTexture = 3.5;
// earth image map
PImage p;
// stars
int starCount = 500;
Point[] stars = new Point[starCount];
void setup(){
size(400, 400, P3D);
// load image map
p = loadImage("earth.png");
// stars
for (int i=0; i<starCount; i++){
stars[i] = new Point(int(random(width)), int(random(height)));
}
// set array values
for (int i=0; i<orbCount; i++){
orb[i] = new Orb(random(5, 10), 0, random(.5, 2));
velocity[i] = new Vect2D(1 + random(-sprayRadius, 
sprayRadius), 0);
damping[i] = random(dampingMin, dampingMax);
cols[i] = color(random(200, 255), random(255), 
random(100), random(20, 255));
}
// calculate ground peakHeights
for (int i=0; i<peakHeights.length; i++){
peakHeights[i] = random(-groundTexture, groundTexture);
}
// calculate points for planet surface, along arc.
float ang = 200.0;
float[] px = new float[segments+1];
float[] py = new float[segments+1];
for (int i=0; i<segments; i++){
px[i] = width-50 + cos(radians(ang))*(width*1.3+peakHeights[i]);
py[i] = height*1.75 + sin(radians(ang))*(height+peakHeights[i]);
ang+=90.0/segments;
}
// instantiate Ground objects
for (int i=0; i<segments; i++){
ground[i] = new Ground(px[i], py[i], px[i+1], py[i+1]);
}
}
void draw(){
// background
noStroke();
fill(0, 15);
rect(0, 0, width, height);
// draw stars
for (int i=0; i<starCount; i++){
stroke(random(100, 255), random(255));
point(stars[i].x, stars[i].y);
}
// draw earth
noStroke();
// bring alpha back to 100%
fill(0, 255);
beginShape();
texture(p);
float imageShiftX = 20;
float imageShiftY = -240;
for (int i=0; i<segments; i++){
vertex(ground[i].x1, ground[i].y1, ground[i].x1+imageShiftX, 
ground[i].y1+imageShiftY);
}
vertex(ground[segments-1].x1, ground[0].y1, 
ground[segments-1].x1+ imageShiftX, 
ground[0].y1+imageShiftY);
vertex(ground[0].x1, ground[0].y1, ground[0].x1+imageShiftX, 
ground[0].y1+imageShiftY);
endShape(CLOSE);
// draw and move orb
for (int i=0; i<emitter; i++){
orb[i].x += velocity[i].vx;
velocity[i].vy += gravity;
orb[i].y += velocity[i].vy;
fill(cols[i]);
ellipse(orb[i].x, orb[i].y, orb[i].r*2, orb[i].r*2);
// collision detection
checkWallCollision(orb[i], velocity[i], damping[i]);
for (int j=0; j<segments; j++){
checkGroundCollision(ground[j], orb[i], velocity[i], damping[i]);
}
}
if (emitter < orbCount-1){
emitter += birthRate;
}
}