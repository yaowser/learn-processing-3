//y=2x^2-3x+19

size(200,200);
background(255);
strokeWeight(3);
float x=0, y=0;
int loopLimit=100;
float ratio = height/(2*pow(loopLimit-1,2)-3*loopLimit-1+19);
for(int i=0; i<loopLimit; i++){
  x=i;
  y=2*pow(x,2)-3*x+19;
  point(x,y*ratio);
}