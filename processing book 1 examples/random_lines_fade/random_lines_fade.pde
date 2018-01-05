//Random Bounded Quads
size (250, 250);
background(255);
smooth();
int[]boundinBox = {50, 50, 150, 150};
fill(0);
rect(boundinBox[0], boundinBox[1], boundinBox[2], boundinBox[3]);
strokeJoin(BEVEL);
beginShape(QUADS);
for (int i=0; i<1000; i++){
stroke(random(50, 255));
fill(0, 0);
strokeWeight(random(.5, 2));
vertex(random(boundinBox[0], boundinBox[0]+boundinBox[2]), 
random(boundinBox[1], boundinBox[1]+boundinBox[3]));
}
endShape();