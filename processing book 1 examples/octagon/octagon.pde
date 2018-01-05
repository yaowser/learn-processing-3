//Octagon
size(400, 400);
background(255);
smooth();
int margin = 50;
fill(0);
stroke(127);
strokeWeight(6);
beginShape();
vertex(3, height/2);
vertex(margin, margin);
vertex(width/2, 3);
vertex(width-margin, margin);
vertex(width-3, height/2);
vertex(width-margin, height-margin);
vertex(width/2, height-3);
vertex(margin, height-margin);
endShape(CLOSE);