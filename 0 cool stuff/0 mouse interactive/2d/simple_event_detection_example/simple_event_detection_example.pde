/**
 * Simple event detection example
 * - caligraphic drawing with Processing
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

boolean isDrawable = false;
void setup(){
  size(400, 400);
  background(255);
  smooth();
}

// need to include draw() for event detection
void draw(){
  // stroke weight based on angle of drawing
  float wt = abs(degrees(atan2((mouseX-pmouseX), (mouseY-pmouseY)))*.1);
  strokeWeight(wt);
  if (isDrawable){
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}

void mousePressed(){
  isDrawable = true;
}
void mouseReleased(){
  isDrawable = false;
}

