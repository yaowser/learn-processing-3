float ax, ay, cx1, cy1, cx2, cy2;
boolean isOnControl1, isOnControl2, isOnAnchor;
float radius = 5;
void setup() {
size(600, 600);
cx1 = random(100, width-100);
cy1 = random(100, height-100);
cx2 = random(100, width-100);
cy2 = random(100, height-100);
ax =random(100, width-100);
ay = random(100, height-100);
} // end setup
void draw() {
background(255);
noFill();
strokeWeight(4);
stroke(0);
// draw curve
beginShape();
vertex(width/2, height/2); // this may be another bezierVertex()
bezierVertex(cx1, cy1, cx2, cy2, ax, ay);
endShape();
// draw center point
fill(200);
strokeWeight(1);
ellipse(width/2, height/2, radius*2, radius*2);
// draw connecting handles
line(cx1, cy1, ax, ay);
line(cx2, cy2, ax, ay);
// draw control points
fill(0, 0, 255);
rect(cx1-radius, cy1-radius, radius*2, radius*2);
rect(cx2-radius, cy2-radius, radius*2, radius*2);
// draw anchor point
fill(255, 127, 0);
ellipse(ax, ay, radius*2, radius*2);
// detect if mouse is on control/anchor point
if (dist(mouseX, mouseY, ax, ay) < radius) {
isOnAnchor = true;
}
else if (dist(mouseX, mouseY, cx1, cy1) < radius) {
isOnControl1 = true;
}
else if (dist(mouseX, mouseY, cx2, cy2) < radius) {
isOnControl2 = true;
}
else {
isOnAnchor = isOnControl1 = isOnControl2 = false;
}
} // end draw
void mouseDragged() {
// move points
if (isOnControl1) {
cx1 = mouseX;
cy1 = mouseY;
}
else if (isOnControl2) {
cx2 = mouseX;
cy2 = mouseY;
}
else if (isOnAnchor) {
ax = mouseX;
ay = mouseY;
}
} // end mouseDragged