// Custom Rotation of a Rectangle Around the X-, Y-, and Z-Axes
// rectangle's vertices before rotation
float[][]originalVertices = new float[4][3];
// rectangle's vertices after rotation
float[][]transformedVertices = new float[4][3];
// control rectangle rotations
float angleX, angleY, angleZ;
void setup(){
size(400, 400, P3D);
/* generate initial rectangle coordinate data
filling originalVertices array */
// creates rectangle parallel to window
float angle = 45;
for (int i=0; i<4; i++){
originalVertices[i][0] = cos(radians(angle))*50;
originalVertices[i][1] = sin(radians(angle))*50;
originalVertices[i][2] = 0;
angle+=360/4.0;
}
}
void draw(){
background(100);
// rotate rectangle around all 3 axes
myRotateX(2);
myRotateY(6);
myRotateZ(3);
//draw rect
createRect();
}
void myRotateX(float deg){
angleX+=deg;
}
void myRotateY(float deg){
angleY+=deg;
}
void myRotateZ(float deg){
angleZ+=deg;
}
void createRect(){
translate(width/2, height/2, 200);
transformedVertices = rotateVertices();
beginShape();
for (int i=0; i<4; i++){
vertex(transformedVertices[i][0], transformedVertices[i][1], 
transformedVertices[i][2]);
}
endShape(CLOSE);
}
// called every frame
float[][]rotateVertices(){
// arrays to temporarily store rotated vertices
float[][]rotatedVertices_XAxis = new float[4][3];
float[][]rotatedVertices_YAxis = new float[4][3];
float[][]rotatedVertices_ZAxis = new float[4][3];
for (int i=0; i<4; i++){
// rotation around x-axis
rotatedVertices_XAxis[i][0] = originalVertices[i][0];
rotatedVertices_XAxis[i][1] = cos(radians(angleX))* 
originalVertices[i][1] - sin(radians(angleX))* 
originalVertices[i][2];
rotatedVertices_XAxis[i][2] = sin(radians(angleX))* 
originalVertices[i][1] + cos(radians(angleX))* 
originalVertices[i][2];
// rotation around y-axis
rotatedVertices_YAxis[i][1] = rotatedVertices_XAxis[i][1];
rotatedVertices_YAxis[i][2] = cos(radians(angleY))* 
rotatedVertices_XAxis[i][2] - sin(radians(angleY))* 
rotatedVertices_XAxis[i][0];
rotatedVertices_YAxis[i][0] = sin(radians(angleY))* 
rotatedVertices_XAxis[i][2] + cos(radians(angleY))* 
rotatedVertices_XAxis[i][0];
// rotation around z-axis
rotatedVertices_ZAxis[i][0] = cos(radians(angleZ))* 
rotatedVertices_YAxis[i][0] - sin(radians(angleZ))* 
rotatedVertices_YAxis[i][1];
rotatedVertices_ZAxis[i][1] = sin(radians(angleZ))* 
rotatedVertices_YAxis[i][0] + cos(radians(angleZ))* 
rotatedVertices_YAxis[i][1];
rotatedVertices_ZAxis[i][2] = rotatedVertices_YAxis[i][2];
}
return rotatedVertices_ZAxis;
}