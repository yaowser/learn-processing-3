void checkWallCollision(){
if (orb.x > width-orb.r){
orb.x = width-orb.r;
velocity.vx *= -1;
velocity.vx *= damping;
}
else if (orb.x < orb.r){
orb.x = orb.r;
velocity.vx *= -1;
velocity.vx *= damping;
}
}