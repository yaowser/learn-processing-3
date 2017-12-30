/* Trig Rotation Expressions
-mouse press to rotate
Special thanks to kirupa.com*/
float[] x = new float[2];
float[] y = new float[2];
float[] newX = new float[2];
float[] newY = new float[2];
float theta;
void setup(){
size(400, 400);
float t = random(TWO_PI);
/* I used the simple trig rotation form
to generate the original line coords */
x[0] = cos(t)*-50;
y[0] = sin(t)*-50;
x[1] = cos(t)*50;
y[1] = sin(t)*50;
}
void draw(){
background(255);
translate(width/2, height/2);
/* I used the longer trig rotation form to
rotate based on the existing rotation */
newX[0] = cos(theta)*x[0] - sin(theta)*y[0];
newY[0] = cos(theta)*y[0] + sin(theta)*x[0];
newX[1] = cos(theta)*x[1] - sin(theta)*y[1];
newY[1] = cos(theta)*y[1] + sin(theta)*x[1];
line(newX[0], newY[0], newX[1], newY[1]);
// to rotate
if (mousePressed){
theta += radians(1);
}
}