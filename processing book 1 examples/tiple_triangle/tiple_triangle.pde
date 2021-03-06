//create 3 triangles
size(600, 200);
background(0);
stroke(255);
noFill();
strokeWeight(10);
smooth();
float x = 0, y = 0;
// sets initial shape rotation
float angle = 30;
// join types
int[]joins = {MITER, BEVEL, ROUND};
for (int j=1; j<4; j++){
beginShape();
strokeJoin(joins[j-1]);
for (int i=0; i<3; i++){
x = (width/4)*j+cos(radians(angle))*width/8;
y = height/2+sin(radians(angle))*width/8;
vertex(x, y);
// create an equilateral tirangle
angle+=120;
}
endShape(CLOSE);
}