// Single Axis 3D Rotation
// rectangle vertices
float[][]rectX = new float[3][4];
float[][]rectY = new float[3][4];
float[][]rectZ = new float[3][4];
// rotation variables
float[]angle = {45, 45, 45};
float[]rot = {1, 1, 1};
void setup(){
size (400, 200, P3D);
}
void draw(){
background(255);
for (int i=0; i<3; i++){
pushMatrix();
// spread rects evenly across window
translate(75+(125*i), height/2);
beginShape();
for (int j=0; j<4; j++){
// rotation around z-axis
if (i==0){
rectX[i][j] = cos(radians(angle[i]))*50;
rectY[i][j] = sin(radians(angle[i]))*50;
}
// rotation around x-axis
else if (i==1){
rectY[i][j] = cos(radians(angle[i]))*50;
rectZ[i][j] = sin(radians(angle[i]))*50;
// offset added just to show rotation better
rectX[i][j] = 10;
}
// rotation around y-axis
else if (i==2){
rectZ[i][j] = cos(radians(angle[i]))*50;
rectX[i][j] = sin(radians(angle[i]))*50;
// offset added just to show rotation better
rectY[i][j] = 10;
}
vertex(rectX[i][j], rectY[i][j], rectZ[i][j]);
angle[i]+=360/4;
angle[i]+=rot[i];
}
endShape(CLOSE);
popMatrix();
}
}