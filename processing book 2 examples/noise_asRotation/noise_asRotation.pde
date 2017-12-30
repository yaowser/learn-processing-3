// noise.pde, chapter 9
import processing.opengl.*;
void setup() {
float[][] data = new float[500][500];
size(500, 500, P3D); // use the P3D renderer instead of the default
smooth();
genNoise(data);
asRotation(data);
} // end setup()
void genNoise(float[][] data) {
float noiseScale=0.015;
noiseDetail(2); // use only 2 octaves
for (int i = 0; i < data.length; i++) {
for (int j=0; j< data[i].length; j++) {
data[i][j] = noise(i*noiseScale, j*noiseScale);
}
}
} // end getNoise()
void asPoint(float[][] data) {
for (int i = 0; i < data.length; i++) {
for (int j = 0; j < data[i].length; j++) {
//stroke(data[i][j]*255); // grayscale colors
stroke(0, data[i][j]*255, 255-255*data[i][j]); //blue to green colors
ellipse(j, i, 1, 1);
}
}
} // end asPoint()
void asSquare3D(float[][] data) {
int s = 10; // size of squares
for (int i = 0; i < data.length; i+=s) {
for (int j = 0; j < data[i].length; j+=s) {
stroke(data[i][j]*255);
noFill();
pushMatrix();
// the larger data[i][j] is, the closer the square is drawn
translate(j, i, data[i][j]*s*2);
rect(0, 0, data[i][j]*s, data[i][j]*s);
popMatrix();
}
}
} // end asSquare3D()
void asSquareColor(float[][] data) {
int s = 10; // base size of squares
for (int i = 0; i < data.length; i+=s) {
for (int j = 0; j < data[i].length; j+=s) {
stroke(255, data[i][j]*255, 0);
noFill();
pushMatrix();
translate(j, i);
rect(0, 0, data[i][j]*s*2, data[i][j]*s*2);
popMatrix();
}
}
} // end asSquareColor()
void asRotation(float[][] data) {
int s = 5; // base size of lines
for (int i = 0; i < data.length; i+=s) {
for (int j = 0; j < data[i].length; j+=s) {
stroke(255, 50); // white, semi-transparent
strokeWeight(2);
pushMatrix();
translate(j, i);
// the larger data[i][j] is, the closer to 2PI we rotate
rotate(data[i][j]*PI*2);
line(0, 0, s*4, 0);
popMatrix();
}
}
} // end asRotation()