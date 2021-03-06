/* Tile Designer
Ira Greenberg, October 11, 2006
draw to off-screen buffer
to create a tiled background */
PGraphics p;
int tiles = 10;
float strokeWt = 2.75;
float scaleFactor;
boolean isRecordable = false;
void setup() {
size(400, 400);
background(0);
smooth();
float tileWidth = width/tiles;
scaleFactor = tileWidth/width;
}
void draw() {
// write to off-screen buffer
if (isRecordable){
p.line(pmouseX, pmouseY, mouseX, mouseY);
}
// preview drawing of tile
if (mousePressed){
stroke(255);
line(pmouseX, pmouseY, mouseX, mouseY);
}
}
void mousePressed(){
p = createGraphics(width, height, JAVA2D);
noStroke();
fill(0);
rect(0, 0, width, height);
isRecordable = true;
p.beginDraw();
p.background(0);
p.stroke(255);
p.strokeWeight(strokeWt/scaleFactor);
}
void mouseReleased(){
p.endDraw();
isRecordable = false;
// scale tile
scale(scaleFactor);
for (int i=0; i<tiles; i++){
for (int j=0; j<tiles; j++){
// draw off-screen image
image(p, i*width, j*height);
}
}
}