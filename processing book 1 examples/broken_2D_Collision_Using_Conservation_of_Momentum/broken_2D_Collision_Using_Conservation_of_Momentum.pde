// Main Sketch Tab
// 2D Collision Using Conservation of Momentum
Ball[] balls = {
new Ball(100, 400, 10), new Ball(700, 400, 40) };
Vect2D[] vels = {
new Vect2D(4.3, -2.7), new Vect2D(-3.3, .95) };
void setup(){
size(400, 400);
smooth();
noStroke();
}
void draw(){
background(255);
fill(150);
for (int i=0; i<2; i++){
balls[i].x += vels[i].vx;
balls[i].y += vels[i].vy;
ellipse(balls[i].x, balls[i].y, balls[i].r*2, balls[i].r*2);
checkBoundaryCollision(balls[i], vels[i]);
}
checkObjectCollision(balls, vels);
}