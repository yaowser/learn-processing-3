/*
Simple Color Example
Ira Greenberg, November 10, 2005
*/
size(200, 200);
background(200, 50, 40);
stroke(45);
fill(200, 200, 0);
rect(25, 50, 50, 50);
ellipseMode(CORNER);
fill(200, 200, 0, 125);
stroke(175, 0, 255);
ellipse(125, 50, 50, 50);
noStroke();
colorMode(RGB, 1.0);
fill(0, .85, .2);
triangle(25, 175, 75, 175, 50, 125);
colorMode(HSB, 100, 10, .1);
fill(50, 9, .08);
beginShape();
vertex(125, 125);
vertex(120, 145);
vertex(140, 160);
vertex(145, 170);
vertex(175, 175);
vertex(182, 150);
vertex(155, 138);
vertex(145, 120);
endShape(CLOSE);