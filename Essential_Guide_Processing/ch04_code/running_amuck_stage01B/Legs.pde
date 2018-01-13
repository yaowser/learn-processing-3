/**
 * Legs class, stage 01 
 * Draw legs
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Legs{
  // instance properties with default values
  float w = 150.0, ht = 125.0;
  color col = #77AA22;
  // advanced properties
  float detailW = w/6.0, detailHt = ht/8.0;
  float shoeBulge = detailHt*2.0;
  float legGap = w/7.0;

  // default constructor
  Legs(){
  }

  // standard constructor
  Legs(float w, float ht, color col){
    this.w = w;
    this.ht = ht;
    this.col = col;
    fill(col);
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
    curveVertex(w/2 - detailW + shoeBulge,  detailHt/2.0);
    curveVertex(w/2.0 - detailW,  0.0);
    vertex(w/2.0 - detailW,  0.0);
    // end right foot
    vertex(w/2.0 - detailW,  - ht + detailHt);
    vertex(w/2.0,  - ht + detailHt);
    vertex(w/2.0,  - ht);
    endShape(CLOSE);
  }
}



