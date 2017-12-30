// grayScaleTrigAnimation.pde, chapter 9
int rows = 100;
int cols = 100;
float[][] grays = new float[rows][cols];
float[][] incs = new float[rows][cols];
int cellSize = 5;
void setup() {
size(500, 500);
noStroke();
//initialize the color values and values of increment
for (int i = 0; i < rows; i++) {
for (int j = 0; j < cols; j++) {
float x = map(i, 0, rows-1, 0, 2*PI); // map x index to 0-2PI
float y = map(j, 0, cols-1, 0, 2*PI); // map y index to 0-2PI
float z = sin(x)*cos(y);
grays[i][j] = map(z, -1.0, 1.0, 0.0, 255.0); // map product z to 0-255
incs[i][j] = 1;
}
}
} // end setup()
void draw() {
background(255);
for (int i = 0; i < rows; i++) {
for (int j = 0; j < cols; j++) {
// fill with color from corresponding location in array
fill(grays[i][j]);
pushMatrix();
translate(j*cellSize, i*cellSize);
rect(0, 0, cellSize, cellSize);
popMatrix();
// reverse direction of color change
if (grays[i][j] > 255 || grays[i][j] < 0) {
incs[i][j] = -incs[i][j];
}
//increment/decrement color
grays[i][j] += incs[i][j];
}
}
} //end draw()