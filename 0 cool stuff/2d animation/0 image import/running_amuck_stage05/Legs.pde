/**
 * Legs class, stage 04
 * Finished Legs class
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Legs{
  // instance properties with default values
  float w = 150.0, ht = 125.0;
  color col = #77AA22;
  // declare advanced properties
  float detailW, detailHt, shoeBulge, legGap;
  // stride properties
  float strideL, strideR, strideRate, strideHt, fallOff, theta;
  // location properties
  PVector loc, initialLoc;
  // dynamics properties
  float speedX, speedZ, strideSpeed, damping;

  // default constructor
  Legs(){
    // initialize
    init();
  }

  // constructor
  Legs(float w, float ht, color col){
    this.w = w;
    this.ht = ht;
    this.col = col;
    fill(col);
    // initialize
    init();
  }

  // constructor
  Legs(PVector loc, float w, float ht, color col){
    this.loc = loc;
    // get and keep initial location vector
    initialLoc = loc.get();
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
    strideRate = PI/30;
    strideHt = ht/2;
    fallOff = .9;
    // init dynamics values
    speedX = 1.0;
    strideSpeed = 1.2;
    damping = .9;
  }

  // draw legs
  void create(){
    fill(col);
    float footWidth = (w - legGap)/2;
    beginShape();
    vertex(loc.x - w/2, loc.y - ht, loc.z);
    vertex(loc.x - w/2, loc.y - ht + detailHt, loc.z);
    vertex(loc.x - w/2 + detailW, loc.y - ht + detailHt, loc.z);
    // left foot
    vertex(loc.x - w/2 + detailW,  loc.y + strideL, loc.z);
    curveVertex(loc.x - w/2 + detailW, loc.y + strideL, loc.z);
    curveVertex(loc.x - w/2 + detailW, loc.y + strideL, loc.z);
    curveVertex(loc.x - w/2 + detailW - shoeBulge,  loc.y + detailHt/2 + strideL, loc.z);
    curveVertex(loc.x - w/2,  loc.y + detailHt + strideL, loc.z);
    curveVertex(loc.x - w/2,  loc.y + detailHt + strideL, loc.z);
    vertex(loc.x - w/2 + footWidth,  loc.y + detailHt + strideL*fallOff, loc.z);
    // end left foot
    vertex(loc.x - w/2 + footWidth + legGap/2,  loc.y - ht + detailHt, loc.z);
    vertex(loc.x - w/2 + footWidth + legGap/2,  loc.y - ht + detailHt, loc.z);
    // right foot
    vertex(loc.x - w/2 + footWidth + legGap,  loc.y + detailHt + strideR*fallOff, loc.z);
    vertex(loc.x + w/2,  loc.y + detailHt + strideR, loc.z);
    curveVertex(loc.x + w/2,  loc.y + detailHt + strideR, loc.z);
    curveVertex(loc.x + w/2,  loc.y + detailHt + strideR, loc.z);
    curveVertex(loc.x + w/2 - detailW + shoeBulge,  loc.y + detailHt/2 + strideR, loc.z);
    curveVertex(loc.x + w/2 - detailW,  loc.y + strideR, loc.z);
    vertex(loc.x + w/2 - detailW,  loc.y + strideR, loc.z);
    // end right foot
    vertex(loc.x + w/2 - detailW,  loc.y - ht + detailHt, loc.z);
    vertex(loc.x + w/2,  loc.y - ht + detailHt, loc.z);
    vertex(loc.x + w/2,  loc.y - ht, loc.z);
    endShape(CLOSE);
  }

  // make the legs stride
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

  // dynamics animation
  void setDynamics(float speedX, float strideSpeed, float damping){
    this.speedX = speedX;
    this.strideSpeed = strideSpeed;
    this.damping = damping;
  }

  // moves legs along x, y, z axes
  void move(float minZ, float maxZ){
    // move legs along y-axis
    loc.y = initialLoc.y+strideR*damping;
    /* move legs along x-axis and
     check for collision against frame edge */
    loc.x += speedX;
    if (screenX(loc.x, loc.y, loc.z) > width){
      speedX *= -1;
    } 
    else if (screenX(loc.x, loc.y, loc.z) < 0){
      speedX *= -1;
    }
    /* move legs along z-axis based on speed of striding
     and check for collision against extremes */
    speedZ = strideRate*strideSpeed;
    loc.z += speedZ;
    if (loc.z > maxZ){
      strideSpeed *= -1;
    } 
    else if (loc.z < minZ){
      strideSpeed *= -1;
    }
  }

  // return strideSpeed
  float getStrideSpeed(){
    return strideSpeed;
  }
}
























