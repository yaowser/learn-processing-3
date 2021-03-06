/* Extrusion Example
move right to left to rotate
drag up and down to extrude
*/
float depth = 0, boxDepth = 0;
float mousePt_Y = 0;
void setup(){
size(500, 300, P3D);
}
void draw(){
background(25);
lights();
fill(100, 100, 175);
stroke(200);
translate(width/2, height/2);
rotateY(radians(mouseX));
box(100, 50, boxDepth);
}
void mouseDragged(){
boxDepth = depth + (mousePt_Y-mouseY);
}
void mousePressed(){
mousePt_Y = mouseY;
}
void mouseReleased(){
depth = boxDepth;
}