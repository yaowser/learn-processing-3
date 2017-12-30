/*
Simple Quadratic Curve
equation: f(x) = x*x - 20x + 200
Ira Greenberg, October 10, 2005
*/
float x, y;
// adjusts y to fit in sketch window coordinate space
float curveFittingFactor = .03;
void setup(){
size(400, 400);
background(255);
fill(0);
for (int i=-102; i<124; i++){
x = i;
y = pow(i, 2)-20*x+200;
ellipse(x+200, y*curveFittingFactor, 4, 4);
}
}