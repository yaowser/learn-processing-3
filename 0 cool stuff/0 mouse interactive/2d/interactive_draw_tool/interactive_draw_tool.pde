/*
Hairy Brush Drawing
Ira Greenberg, October 9, 2006
outputs to PDF
*/
import processing.pdf.*;
void setup() {
size(400, 400);
background(255);
smooth();
String id = str(hour())+"_"+str(minute())+"_"+str(second());
beginRecord(PDF, "img"+id+".pdf");
}
void draw() {
stroke(0);
strokeWeight(4);
if (mousePressed){
line(pmouseX, pmouseY, mouseX, mouseY);
bleed(pmouseX, pmouseY);
}
}
void bleed(float x, float y){
float px = 0, py = 0, angle = 0, radius=10;
float brushDetail = 36;
stroke(0, 100);
strokeWeight(.5);
for (int i=0; i<brushDetail; i++){
px = x+cos(radians(angle))*random(radius);
py = y+sin(radians(angle))*random(radius);
line(x, y, px, py);
angle+=360/brushDetail;
}
}
// press any key on the keyboard to
// output a pdf of your drawing
void keyPressed() {
endRecord();
exit();
}