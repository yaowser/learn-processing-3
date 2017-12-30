// Moving Along a Vector
float lineX1, lineY1, lineX2, lineY2;
float vectX, vectY, vectMag, directionX, directionY;
float ellipseX, ellipseY;
float ellipseSpeed = 2;
void setup(){
size(400, 400);
fill(128);
smooth();
lineX1 = 100;
lineY1 = 75;
lineX2 = 300;
lineY2 = 325;
// express line as a vector
vectX = lineX2-lineX1;
vectY = lineY2-lineY1;
// find magnitude(length) of vector
vectMag = sqrt(vectX*vectX + vectY*vectY);
/* normalize vector to get
base direction ratio */
directionX = vectX/vectMag;
directionY = vectY/vectMag;
// start ellipse on line
ellipseX = lineX1;
ellipseY = lineY1;
}
void draw(){
background(255);
// draw line
line(lineX1, lineY1, lineX2, lineY2);
//draw ellipse
ellipse(ellipseX, ellipseY, 20, 20);
// move elipse
ellipseX += directionX * ellipseSpeed;
ellipseY += directionY * ellipseSpeed;
// keeps ellipse moving along line
if (ellipseX>lineX2 && ellipseY>lineY2 ||
ellipseX<lineX1 && ellipseY<lineY1) {
/* when ellipse reaches end of vector
reverse the vector's direction */
directionX *= -1;
directionY *= -1;
}
}