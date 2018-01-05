/*
Sprocket Creator
Ira Greenberg, December 27, 2005
*/
void setup(){
size(600, 600);
background(65);
smooth();
makeSprocket(width/2, height/2, 20, 280, 440, 45, color(0, 0, 0), 
20, color(255, 255, 255), SQUARE, MITER);
makeSprocket(width/2, height/2, 120.0, 275, -230, 45, 
color(200, 200, 200), 2, color(20, 20, 20), SQUARE, ROUND);
makeSprocket(width/2, height/2, 20.0, 250, 120, 45, color(0, 0, 0),
12, color(255, 255, 255), PROJECT, MITER);
makeSprocket(width/2, height/2, 8.0, 120, 190, 45, 
color(20, 20, 20), 14, color(200, 200, 200), PROJECT, MITER);
makeSprocket(width/2, height/2, 8.0, 120, 170, 22.5, 
color(245, 245, 245), 20, color(10, 10, 10), PROJECT, MITER);
makeSprocket(width/2, height/2, 25.0, 90, 35, 45, 
color(255, 255, 255), 2, color(0, 0, 0), PROJECT, MITER);
makeSprocket(width/2, height/2, 8.0, 25, 10, 45, 
color(127, 127, 127), 4, color(255, 255, 255), PROJECT, MITER);
}
void makeSprocket(float x, float y, float spokes, float rad1, 
float rad2, float initRot, color strokeCol, float strokeWt, 
color fillCol, int endCap, int endJoin){
  float px = 0, py = 0, angle = initRot;
float ang = (360.0/spokes)/2.0;
float ang2 = (360.0/spokes)/4.0;
stroke(strokeCol);
strokeWeight(strokeWt);
strokeCap(endCap);
strokeJoin(endJoin);
fill(fillCol);
beginShape();
for (int i = 0; i<spokes; i++){
px = x+cos(radians(angle))*rad1;
py = y+sin(radians(angle))*rad1;
vertex(px, py);
angle+=ang;
px = x+cos(radians(angle))*rad1;
py = y+sin(radians(angle))*rad1;
vertex(px, py);
angle+=ang2;
px = x+cos(radians(angle))*rad2;
py = y+sin(radians(angle))*rad2;
vertex(px, py);
angle+=ang2;
}
endShape(CLOSE);
}