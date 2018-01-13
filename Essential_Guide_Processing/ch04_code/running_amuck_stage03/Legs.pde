/**
 * Legs class, stage 03
 * Making the legs stride
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

public class Legs{
  // instance properties with default values
  float w = 150.0, ht = 125.0;
  color col = #77AA22;
  // declare advanced properties
  float detailW, detailHt, shoeBulge, legGap;
  // stride properties
  float strideL, strideR, strideRate, strideHt, fallOff, theta;

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

  // initializes advanced properties with default values
  void init(){
    detailW = w/6.0;
    detailHt = ht/8.0;
    shoeBulge = detailHt*2.0;
    legGap = w/7.0;
    // init stride values
    strideRate = PI/30.0;
    strideHt = ht/2.0;
    fallOff = .9;
  }

  // draw legs
  void create(){
    fill(col);
    float footWidth = (w - legGap)/2.0;
    beginShape();
    vertex(- w/2.0, - ht);
    vertex(- w/2.0, - ht + detailHt);
    vertex(- w/2.0 + detailW, - ht + detailHt);
    // left foot
    vertex(- w/2.0 + detailW,  strideL);
    curveVertex(- w/2.0 + detailW, strideL);
    curveVertex(- w/2.0 + detailW, strideL);
    curveVertex(- w/2.0 + detailW - shoeBulge,  detailHt/2.0 + strideL);
    curveVertex(- w/2.0,  detailHt + strideL);
    curveVertex(- w/2.0,  detailHt + strideL);
    vertex(- w/2.0 + footWidth,  detailHt + strideL*fallOff);
    // end left foot
    vertex(- w/2.0 + footWidth + legGap/2.0,  - ht + detailHt);
    vertex(- w/2.0 + footWidth + legGap/2.0,  - ht + detailHt);
    // right foot
    vertex(- w/2.0 + footWidth + legGap,  detailHt + strideR*fallOff);
    vertex(w/2.0,  detailHt + strideR);
    curveVertex(w/2.0,  detailHt + strideR);
    curveVertex(w/2.0,  detailHt + strideR);
    curveVertex(w/2.0 - detailW + shoeBulge,  detailHt/2 + strideR);
    curveVertex(w/2.0 - detailW,  strideR);
    vertex(w/2.0 - detailW,  strideR);
    // end right foot
    vertex(w/2.0 - detailW,  - ht + detailHt);
    vertex(w/2.0,  - ht + detailHt);
    vertex(w/2.0,  - ht);
    endShape(CLOSE);
  }

  // make the legs run
  void stride(){
    strideL = sin(theta)*strideHt;
    strideR = cos(theta)*strideHt;
    theta += strideRate;
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
  
  // customize stride
  void setStride(float strideHt, float strideRate, float fallOff){
    this.strideHt = strideHt;
    this.strideRate = strideRate;
    this.fallOff = fallOff;
  }
}

















