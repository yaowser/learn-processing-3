/**
 * Nested pushMatrix()-popMatrix()
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

void setup(){
  // set up environment
  size(800, 800);
  background(255);
  smooth();
  rectMode(CENTER);
  // declare some variables
  int cols = 6;
  int rows = 6;
  int margin = 50;
  float cellW = (width-margin*2)/cols;
  float cellH = (height-margin*2)/rows;

  for (int i=0; i<=cols; i++){
    for (int j=0; j<=rows; j++){
      //outer push-pop for table positioning
      pushMatrix();
      translate(margin+cellW*i,  margin+cellH*j);
      int rots = (int)random(12, 24);
      float len = random(10, 20);
      fill(0);
      noStroke();
      // inner push-pop for rotations
      pushMatrix();
      for (int k=0; k<rots; k++){

        rotate(TWO_PI/rots);
        rect(0, 0, random(.5, 1), random(15, cellH));

        /*inner, inner push-pops for 
         translating along rotations*/
        pushMatrix();
        translate(0, 10);
        rect(0, 0, random(1, 3), random(1, 3));
        popMatrix();

        pushMatrix();
        translate(0, len);
        rect(0, 0, random(2, 4), random(2, 4));
        popMatrix();
      }
      popMatrix();
      // draw table cell outlines
      noFill();
      stroke(200);
      rect(0, 0, cellW, cellH);
      popMatrix();
    }
  }
}




