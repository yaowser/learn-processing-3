/**
 * Mouse events
 * RoundedRect class
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

class RoundedRect{

  // instance properties with default values
  int x, y;
  int w = 100, h = 50;
  float radius = min(25.0, h/2.0);
  int detail = 8;
  int border = 1;

  // default constructor
  RoundedRect(){
  } 

  // constructor
  RoundedRect(int x, int y, int w, int h, float radius){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    // keep corner radius within bounds
    this.radius = min(radius, h/2.0);
  } 

  // constructor
  RoundedRect(int x, int y, int w, int h, float radius, int detail, int border){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    // keep corner radius within bounds
    this.radius = min(radius, h/2.0);
    this.detail = detail;
    this.border = border;
  } 

  // draw rounded rect
  void create(){
    float theta = 0.0;
    float px = 0, py = 0;
    beginShape();
    // right bottom corner
    for(int i=0; i<detail; i++){
      px = x+w-radius+cos(theta)*radius;
      py = y+h-radius+sin(theta)*radius;
      vertex(px, py);
      theta+=(PI/2)/detail;
    }
    // left bottom corner
    for(int i=0; i<detail; i++){
      px = x+radius+cos(theta)*radius;
      py = y+h-radius+sin(theta)*radius;
      vertex(px, py);
      theta+=(PI/2)/detail;
    }
    // left top corner
    for(int i=0; i<detail; i++){
      px = x+radius+cos(theta)*radius;
      py = y+radius+sin(theta)*radius;
      vertex(px, py);
      theta+=(PI/2)/detail;
    }
    // right top corner
    for(int i=0; i<detail; i++){
      px = x+w-radius+cos(theta)*radius;
      py = y+radius+sin(theta)*radius;
      vertex(px, py);
      theta+=(PI/2)/detail;
    }
    endShape(CLOSE);
  }

  /* return a PImage of the button
   - useful as an image mask */
  PImage getPImage(){
    // create off-screen graphic
    PGraphics pg = createGraphics(w, h, JAVA2D);
    float theta = 0.0;
    float px = 0, py = 0;
    // draw into graphics object
    pg.beginDraw();
    pg.strokeWeight(border);
    pg.smooth();
    pg.beginShape();
    // right bottom corner
    for(int i=0; i<detail; i++){
      px = w-radius+cos(theta)*radius;
      py = h-radius+sin(theta)*radius;
      pg.vertex(px, py);
      theta+=(PI/2)/detail;
    }
    // left bottom corner
    for(int i=0; i<detail; i++){
      px = radius+cos(theta)*radius;
      py = h-radius+sin(theta)*radius;
      pg.vertex(px, py);
      theta+=(PI/2)/detail;
    }
    // left top corner
    for(int i=0; i<detail; i++){
      px = radius+cos(theta)*radius;
      py = radius+sin(theta)*radius;
      pg.vertex(px, py);
      theta+=(PI/2)/detail;
    }
    // right top corner
    for(int i=0; i<detail; i++){
      px = w-radius+cos(theta)*radius;
      py = radius+sin(theta)*radius;
      pg.vertex(px, py);
      theta+=(PI/2)/detail;
    }
    pg.endShape(CLOSE);
    pg.endDraw();

    return pg;
  }
}






