// Brick Tower
// Point3D and Cube classes required.
float bricksPerLayer = 16.0; // value must be even
float brickLayers = 25.0;
Cube[]bricks = new Cube[int(bricksPerLayer*brickLayers)];
float brickWidth = 60, brickHeight = 25, brickDepth = 25;
float radius = 150.0;
float angle = 0;
void setup(){
size(400, 400, P3D);
//instantiate bricks
for (int i=0; i<bricks.length; i++){
bricks[i] = new Cube(brickWidth, brickHeight, brickDepth);
}
}
void draw(){
background(100, 125, 200);
float tempX = 0, tempY = 0, tempZ = 0;
fill(175, 87, 20);
stroke(100, 50, 10);
// add basic light setup
lights();
translate(width/2, height*1.2, -550);
// tip tower to see the inside
rotateX(radians(-45));
// slowly rotate tower
rotateY(frameCount*PI/60);
for (int i=0; i<brickLayers; i++){
// increment rows
tempY-=brickHeight;
// alternate brick seams
angle = 360.0/bricksPerLayer*i/2;
for (int j=0; j<bricksPerLayer; j++){
tempZ = cos(radians(angle))*radius;
tempX = sin(radians(angle))*radius;
pushMatrix();
translate(tempX, tempY, tempZ);
rotateY(radians(angle));
// add crenelation
if (i==brickLayers-1){
if (j%2 == 0){
bricks[j].create();
}
}
// create main tower
else {
bricks[j].create();
}
popMatrix();
angle += 360.0/bricksPerLayer;
}
}
}
// Point3D and Cube classes required