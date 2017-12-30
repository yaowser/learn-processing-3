/*******************************************
* Non-orthogonal Collision with
* Multiple Ground Segments
*******************************************
* Based on Keith Peters's Solution in
* Foundation ActionScript Animation:
* Making Things Move!
* http://www.friendsofed.com/book.html? å
* isbn=1590597915
*******************************************/
Orb orb;
Vect2D velocity;
float gravity = .05, damping = 0.8;
int segments = 40;
Ground[] ground = new Ground[segments];
float[] peakHeights = new float[segments+1];
void setup(){
size(400, 400);
smooth();
orb = new Orb(50, 50, 3);
velocity = new Vect2D(.5, 0);
// calculate ground peak heights
for (int i=0; i<peakHeights.length; i++){
peakHeights[i] = random(height-100, height-90);
}
/* float value required for segment width (segs)
calculations so the ground spans the entire
display window, regardless of segment number. */
float segs = segments;
for (int i=0; i<segments; i++){
ground[i] = new Ground(width/segs*i, peakHeights[i], 
width/segs*(i+1), peakHeights[i+1]);
}
}
void draw(){
// background
noStroke();
fill(0, 15);
rect(0, 0, width, height);
// move orb
orb.x += velocity.vx;
velocity.vy += gravity;
orb.y += velocity.vy;
// draw ground
fill(127);
beginShape();
for (int i=0; i<segments; i++){
vertex(ground[i].x1, ground[i].y1);
vertex(ground[i].x2, ground[i].y2);
}
vertex(ground[segments-1].x2, height);
vertex(ground[0].x1, height);
endShape(CLOSE);
// draw orb
noStroke();
fill(200);
ellipse(orb.x, orb.y, orb.r*2, orb.r*2);
// collision detection
checkWallCollision();
for (int i=0; i<segments; i++){
checkGroundCollision(ground[i]);
}
}