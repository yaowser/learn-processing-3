class Tuple {
int elem0, elem1, elem2;
Tuple(int elem0, int elem1, int elem2) {
this.elem0 = elem0;
this.elem1 = elem1;
this.elem2 = elem2;
}
}
class Face {
PVector[] vecs = new PVector[3];
Face(PVector v0, PVector v1, PVector v2) {
vecs[0]=v0;
vecs[1]=v1;
vecs[2]=v2;
}
void display() {
beginShape();
for (int i=0; i<3; i++) {
vertex(vecs[i].x, vecs[i].y, vecs[i].z);
}
endShape();
}
}
class Tetrahedron {
float r;
// Tetrahedron coords from:
// http://www.csee.umbc.edu/~squire/reference/polyhedra.shtml#tetrahedron
PVector[] verts = {
new PVector(0, 0, 1), // back
new PVector(.943, 0, -.333), // right
new PVector(-.471, -.816, -.333), // left-top
new PVector(-.471, .816, -.333) // left-bottom
};
Tuple[] inds = {
// wind counter-clockwise (right-hand rule)
new Tuple(0, 1, 3),
new Tuple(0, 3, 2),
new Tuple(0, 2, 1),
new Tuple(1, 2, 3)
};
Face[] faces = new Face[4];
// constructor
Tetrahedron(float r) {
this.r = r;
for (int i=0; i<4; i++) {
faces[i] = new Face(verts[inds[i].elem0], verts[inds[i].elem1], verts[inds[i].elem2]);
}
}
void display() {
pushMatrix();
scale(r);
for (int i=0; i<4; i++) {
faces[i].display();
}
popMatrix();
}
}
//Tetrahedron Example
Tetrahedron t;
void setup() {
size(600, 600, P3D);
noStroke();
t = new Tetrahedron(200);
}
void draw() {
background(50);
lights();
translate(width/2, height/2);
rotateX(frameCount*PI/275);
rotateZ(frameCount*PI/175);
t.display();
}