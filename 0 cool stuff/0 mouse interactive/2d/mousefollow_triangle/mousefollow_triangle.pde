// Ravenous Triangle I
float predCntrX, predCntrY;
float predX[] = new float[3];
float predY[] = new float[3];
float predLen = 8.0;
float predAng, predRot;
float easing = .05;
void setup(){
size(400, 400);
predCntrX = width/2;
predCntrY = height/2;
smooth();
}
void draw(){
// repaint background
fill(255, 40);
rect(0, 0, width, height);
/* find distance for x and y
between prey and predator */
float deltaX = (pmouseX-predCntrX);
float deltaY = (pmouseY-predCntrY);
// cause the predator to decelerate
deltaX *= easing;
deltaY *= easing;
predCntrX += deltaX;
predCntrY += deltaY;
// orient predator
predRot = atan2(deltaY, deltaX);
// draw predator
createPredatoryTriangle();
}
void createPredatoryTriangle(){
// draw predator with some trig
fill(0);
beginShape();
for (int i=0; i<3; i++){
predX[i] = predCntrX+cos(radians(predAng)+predRot)*predLen;
predY[i] = predCntrY+sin(radians(predAng)+predRot)*predLen;
vertex(predX[i], predY[i]);
predAng += 120;
}
endShape(CLOSE);
}