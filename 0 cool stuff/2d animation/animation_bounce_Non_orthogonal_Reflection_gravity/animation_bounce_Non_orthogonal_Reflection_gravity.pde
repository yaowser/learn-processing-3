/****************************************
Non-orthogonal Collision
Based on Rotated Coordinates
*****************************************
* Based on Keith Peters's Solution in
* Foundation ActionScript Animation:
* Making Things Move!
* http://www.friendsofed.com/book.html?å
* isbn=1590597915
*****************************************/
Orb orb;
Vect2D velocity;
float gravity = .05, damping = 0.6;
Ground ground;
void setup(){
size(400, 400);
smooth();
orb = new Orb(50, 50, 3);
velocity = new Vect2D(.5, 0);
// random ground slope
ground = new Ground(0, random(250, 390), 
width, random(250, 390));
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
vertex(ground.x1, ground.y1);
vertex(ground.x2, ground.y2);
vertex(ground.x2, height);
vertex(ground.x1, height);
endShape(CLOSE);
// draw orb
noStroke();
fill(200);
ellipse(orb.x, orb.y, orb.r*2, orb.r*2);
// collision detection
checkWallCollision();
checkGroundCollision();
}