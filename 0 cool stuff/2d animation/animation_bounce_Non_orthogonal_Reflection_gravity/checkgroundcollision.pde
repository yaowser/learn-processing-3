void checkGroundCollision() {
// get difference between orb and ground
float deltaX = orb.x - ground.x;
float deltaY = orb.y - ground.y;
// precalculate trig values
float cosine = cos(ground.rot);
float sine = sin(ground.rot);
/* rotate ground and velocity to allow
orthogonal collision calculations */
float groundXTemp = cosine * deltaX + sine * deltaY;
float groundYTemp = cosine * deltaY - sine * deltaX;
float velocityXTemp = cosine * velocity.vx + sine * velocity.vy;
float velocityYTemp = cosine * velocity.vy - sine * velocity.vx;
// ground collision
if (groundYTemp > -orb.r){
// keep orb from going into ground
groundYTemp = -orb.r;
// bounce and slow down orb
velocityYTemp *= -1.0;
velocityYTemp *= damping;
}
// reset ground, velocity and orb
deltaX = cosine * groundXTemp - sine * groundYTemp;
deltaY = cosine * groundYTemp + sine * groundXTemp;
velocity.vx = cosine * velocityXTemp - sine * velocityYTemp;
velocity.vy = cosine * velocityYTemp + sine * velocityXTemp;
orb.x = ground.x + deltaX;
orb.y = ground.y + deltaY;
}