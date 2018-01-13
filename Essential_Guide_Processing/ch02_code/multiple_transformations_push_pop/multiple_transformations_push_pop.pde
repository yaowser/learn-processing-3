/**
 * Multiple Transformations,
 * using pushMatrix()/popMatrix()
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

void setup(){
  size(300, 300);
  background(127);
  smooth();
  noStroke();
  int arms = 72;
  float shades = 255.0/arms;
  translate(width*0.66, height*0.625);
  for (int i=0; i<arms; i++){
    fill((i+1)*shades);
    // set transformations
    pushMatrix();
    translate(-i*2.7, -i*2.5);
    scale(1.0-(1.0/arms)*(i*.8));
    rotate(TWO_PI/arms*i);
    rect(0, 0, 100, 100);
    popMatrix();
  }
}

