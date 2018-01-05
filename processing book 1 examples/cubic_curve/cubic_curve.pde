/*
Simple Cubic Curve
equation: f(x) = .2*x*x*x - 50*x*x - 50*x + x-100
Ira Greenberg, October 10, 2005
*/
float x, y;
// adjusts y to fit in sketch window coordinate space
float curveFittingFactor = .0001;
void setup(){
size(400, 400);
background(255);
fill(0);
for (int i=-102; i<300; i+=2){
x = i;
y = pow(i, 3)*.2+x*x*-50+x-100;
ellipse(x+100, y*curveFittingFactor+200, 2, 2);
}
}