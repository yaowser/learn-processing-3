/*
Maze Tile 1
Ira Greenberg, November 25, 2005
revised October 18, 2006
*/
// declare some vars
float x, y, y2, x2, h, w, xShift, yShift;
//these values can be changed
int xSclFactor = 3;
int ySclFactor = 3;
float wStep = 4;
float hStep = 4;
void setup(){
//these values can be changed
size(400, 400);
background(0);
strokeWeight(1);
stroke(255);
noFill();
smooth();
//end changeable stuff
x = width/xSclFactor;
y = height/ySclFactor;
y2 = x2 = 0;
for (int i=0; i<width; i+=x){
for (int j=0; j<height; j+=y){
h = w = 0;
yShift = j;
xShift = i;
createMaze();
}
}
}
void createMaze(){
beginShape();
vertex((x-w)+xShift, (y2+h)+yShift);
for (float i=min(width/xSclFactor, height/ySclFactor); 
i>min(width/xSclFactor, height/ySclFactor)/2; 
i-=max(wStep, hStep)){
vertex((x-w)+xShift, (y-h)+yShift);
vertex((x2+w)+xShift, (y-h)+yShift);
vertex((x2+w)+xShift, (y2+h)+yShift);
w+=wStep;
vertex((x-w)+xShift, (y2+h)+yShift);
h+=hStep;
}
endShape();
}