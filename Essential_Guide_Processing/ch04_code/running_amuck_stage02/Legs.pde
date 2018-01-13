/**
 * Legs class, stage 02 
 * Draw custom legs
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

public class Legs{
  // instance properties with default values
  float w = 150.0, ht = 125.0;
  color col = #77AA22;
  // declare advanced properties
  float detailW, detailHt, shoeBulge, legGap, footWidth;

  // default constructor
  Legs(){
    // initialize
    init();
  }

  // standard constructor
  Legs(float w, float ht, color col){
    this.w = w;
    this.ht = ht;
    this.col = col;
    fill(col);
    // initialize
    init();
  }

  // initializes advanced property values
  void init(){
    detailW = w/6.0;
    detailHt = ht/8.0;
    shoeBulge = detailHt*2.0;
    legGap = w/7.0;
  }

  // draw legs
  void create(){
    fill(col);
    // local variable ensures foot is within range
    float footWidth = (w - legGap)/2.0;
    beginShape();
    vertex(- w/2.0, - ht);
    vertex(- w/2.0, - ht + detailHt);
    vertex(- w/2.0 + detailW, - ht + detailHt);
    // left foot
    vertex(- w/2.0 + detailW,  0.0);
    curveVertex(- w/2.0 + detailW, 0.0);
    curveVertex(- w/2.0 + detailW, 0.0);
    curveVertex(- w/2.0 + detailW - shoeBulge,  detailHt/2.0);
    curveVertex(- w/2.0,  detailHt);
    curveVertex(- w/2.0,  detailHt);
    vertex(- w/2.0 + footWidth,  detailHt);
    // end left foot
    vertex(- w/2.0 + footWidth + legGap/2.0,  - ht + detailHt);
    vertex(- w/2.0 + footWidth + legGap/2.0,  - ht + detailHt);
    // right foot
    vertex(- w/2.0 + footWidth + legGap,  detailHt);
    vertex(w/2.0,  detailHt);
    curveVertex(w/2.0,  detailHt);
    curveVertex(w/2.0,  detailHt);
    curveVertex(w/2.0 - detailW + shoeBulge,  detailHt/2.0);
    curveVertex(w/2.0 - detailW,  0.0);
    vertex(w/2.0 - detailW,  0.0);
    // end right foot
    vertex(w/2.0 - detailW,  - ht + detailHt);
    vertex(w/2.0,  - ht + detailHt);
    vertex(w/2.0,  - ht);
    endShape(CLOSE);
  }

  // set advanced property values
  void setDetails(float detailW, float detailHt, 
        float shoeBulge, float legGap){
    this.detailW = detailW;
    this.detailHt = detailHt;
    this.shoeBulge = shoeBulge;
    this.legGap = legGap;
  }

  // update size and reinitialize
  void setSize(float w, float ht){
    this.w = w;
    this.ht = ht;
    init();
  }
}
















