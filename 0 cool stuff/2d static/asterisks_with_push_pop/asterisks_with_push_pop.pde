/**
 * Asterisks with 
 * pushMatrix()/popMatrix()
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

float scl = 1.0;
void setup(){
  size(400, 400);
  background(0);
  stroke(255);
  smooth();
  translate(width/2, height/2);
  float theta = 0;
  float radius = 340;
  float strkWt = 6;
  while (radius>6){
    strokeWeight(strkWt*=.80);
    radius *= .705;
    theta += PI/4;
    for (int j=0; j<4; j++){
      line(cos(theta)*radius, sin(theta)*radius, cos(theta+PI/2)*radius, sin(theta+PI/2)*radius);
      asterisk(cos(theta)*radius, sin(theta)*radius, 20, 20);
      theta+=PI/2;
    }
  }
}

void asterisk(float x, float y, int sides, float rad){
  pushMatrix();
  translate(x, y);
  scale(scl*=.96);
  for (int i=0; i<sides; i++){
    rotate(TWO_PI/sides);
    line(0, 0, rad, rad);
  }
  popMatrix();
}

