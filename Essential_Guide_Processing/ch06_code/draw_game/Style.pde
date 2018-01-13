/**
 * Draw Game
 * Style base class - drawing algorithms
 * - extend Style for custom drawing algoirhtms
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Style {
  Cell c;

  // only a default constructor
  Style(){
  }

  // pass in reference to Cell object
  void init(Cell c){
    this.c = c;
  }

  //draw geometry based on cell value:
  void create(){
    // human player
    if (c.getValue()==-1){
      drawCurvilinear();
    }   // computer player
    else if (c.getValue()==1){
      drawLinear();
    } 
  }

  /* default linear drawing algorithm creates an X
   - generally this will be overrided by subclass*/
  void drawLinear(){
    float cx = c.x + c.padding + c.w/2-c.padding;
    float cy = c.y + c.padding + c.h/2-c.padding;
    float r1 = c.w/2 - c.padding/2;
    float r2 = r1*.15;
    float theta = PI/4.0;
    float phi = TWO_PI/5;
    float px_in1=0, py_in1=0, px_out1=0, py_out1=0;
    float px_out2=0, py_out2=0, px_in2=0, py_in2=0;
    int legs = 3 + c.detail;

    fill(c.cellCols[1]);
    noStroke();
    beginShape();
    for (int i=0; i<legs; i++){
      px_in1 = cx + cos(theta-phi)*r2;
      py_in1 = cy + sin(theta-phi)*r2;
      vertex(px_in1, py_in1);
      px_out1 = cx + cos(theta-phi*.1)*r1;
      py_out1 = cy + sin(theta-phi*.1)*r1;
      vertex(px_out1, py_out1);
      px_out2 = cx + cos(theta+phi*.1)*r1;
      py_out2 = cy + sin(theta+phi*.1)*r1;
      vertex(px_out2, py_out2);
      px_in2 = cx + cos(theta+phi)*r2;
      py_in2 = cy + sin(theta+phi)*r2;
      vertex(px_in2, py_in2);
      theta+=TWO_PI/legs;
    }
    endShape(CLOSE);
  }


  /* default curviliinear drawing algorithm,
   generally this will be overrided by subclass*/
  void drawCurvilinear(){
    float px = c.x+c.padding/2;
    float py = c.y+c.padding/2;
    float diam = c.w-c.padding;
    noStroke();
    float r = red(c.cellCols[1]);
    float g = green(c.cellCols[1]);
    float b = blue(c.cellCols[1]);
    ellipseMode(CORNER);
    int rings = constrain(c.detail, 1, 6);
    float interval = diam/c.detail/2;
    for (int i=0; i<rings; i++){
      fill(r, g, b);
      ellipse(px, py, diam, diam);
      px += interval/2*(i+1);
      py += interval/2*(i+1);
      diam -= interval*(i+1);
      r = min(225, r += 20);
      g = min(225, g += 20);
      b = min(225, b += 20);
    }
    ellipseMode(CENTER);
  }

  /* returns new instance of this class
   need to do this so each Cell has it's own Style object*/
  Style getClone(){
    return new Style();
  }

}












