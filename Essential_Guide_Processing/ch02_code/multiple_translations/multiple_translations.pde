/**
 * Translation along the Z-axis, 
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

void setup(){
  size(400, 200, P3D);
  background(175);
  noStroke();
  fill(255);
  //lights();
  
  // sphere 1
  translate(100, height/2, 0);
  sphere(50);

  // sphere 2
  translate(150, 0, 50);
  sphere(50);
}

