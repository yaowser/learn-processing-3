/* Third-degree polynomial
y = 4x3-6x2+3x-20*/
size(400, 400);
background(255);
strokeWeight(3);
smooth();
float x = 0, y = 0;
int loopLimit = 200;
//shifts curve to the right
int xShift = width/2;
//shifts curve down
int yShift = height/2;
//fits curve to window
float ratio = height/(4* pow(loopLimit-1, 3)-6*pow(loopLimit-1, 2) + 3*loopLimit-1 - 20);
for (int i=-xShift; i<loopLimit; i++){
x = i;
y = 4* pow(x, 3)-6*pow(x, 2) + 3*x - 20;
point(x+xShift, y*ratio+yShift);
}