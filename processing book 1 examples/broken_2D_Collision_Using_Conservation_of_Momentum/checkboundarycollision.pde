// checkBoundaryCollision() function:
void checkBoundaryCollision(Ball ball, Vect2D vel){
if (ball.x > width-ball.r){
ball.x = width-ball.r;
vel.vx *= -1;
}
else if (ball.x < ball.r){
ball.x = ball.r;
vel.vx *= -1;
}
else if (ball.y > height-ball.r){
ball.y = height-ball.r;
vel.vy *= -1;
}
else if (ball.y < ball.r){
ball.y = ball.r;
vel.vy *= -1;
}
}