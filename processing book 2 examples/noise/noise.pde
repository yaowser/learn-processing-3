// noise.pde, chapter 9
import processing.opengl.*;
void setup() {
float[][] data = new float[500][500];
size(500, 500, P3D); // use the P3D renderer instead of the default
smooth();
genNoise(data);
asPoint(data);
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