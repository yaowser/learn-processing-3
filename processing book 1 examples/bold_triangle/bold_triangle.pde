//Create a Triangle
size(400, 400);
background(0);
stroke(255);
strokeWeight(5);
smooth();
noFill();
float x = 0, y = 0;
// sets initial shape rotation
float angle = 30;
beginShape();
for (int i=0; i<3; i++){
x = width/2+cos(radians(angle))*width/2.5;
y = height/2+sin(radians(angle))*width/2.5;
vertex(x, y);
// create an equilateral tirangle
angle+=120;
}
endShape(CLOSE);