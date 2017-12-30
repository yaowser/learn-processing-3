/*
Concentric Maze
Ira Greenberg, November 25, 2005
revised October 18, 2006
*/
size(400, 400);
background(0);
strokeWeight(1);
stroke(255);
smooth();
float x = width-1;
float y = height-1;
float y2 = 0, x2 = 0;
float h = 0, w = 0;
//these values can be changed
float wStep = 10.0;
float hStep = 10.0;
noFill();
beginShape();
vertex(x-w, y2+h);
for (int i=min(width, height); i>min(width, height)/2; 
i-=max(wStep, hStep)){
vertex(x-w, y-h);
vertex(x2+w, y-h);
vertex(x2+w, y2+h);
w+=wStep;
vertex(x-w, y2+h);
h+=hStep;
}
endShape();