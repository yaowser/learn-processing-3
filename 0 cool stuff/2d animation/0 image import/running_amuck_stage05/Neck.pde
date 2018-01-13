/**
 * Neck class
 * Running Amuck
 * - manages Head object
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Neck{
  // drawing properties
  PVector loc;
  int segs;
  float w, ht;
  // bones are drawn based on spine vertices
  PVector[] spine;
  PVector[] bones;
  // controls neck/head bobble physics
  PVector[] springs;
  // springs in neck follow this
  float bobbleLead;
  // control range and rate of bobble
  float bobbleRangeMin, bobbleRangeMax, bobbleRateMin, bobbleRateMax;
  float theta, damping;

  // internal Head object property
  Head head;

  // default constructor
  Neck(Head head){
    this.head = head;
    loc = new PVector();
    segs = 12;
    // set defaults
    init();
  }

  // constructor
  Neck(PVector loc, int segs, float w, float ht, Head head){
    this.loc = loc;
    this.segs = segs;
    this.w = w;
    this.ht = ht;
    this.head = head;
    head.setScale(w*4);
    init();
  }

  void setSegments(int segs){
    this.segs = segs;
    init();
  }

  void setSize(float w, float ht){
    this.w = w;
    this.ht = ht;
    head.setScale(w*4);
    init();
  }

  void init(){
    // structure
    spine = new PVector[segs];
    bones = new PVector[segs*2];
    // set default dynamics
    springs = new PVector[spine.length];
    setDynamics(2.0, 12.0, PI/90.0, PI/60.0, .96);
    // create spine and instantiate springs
    float segHt = ht/segs;
    for (int i=0; i<segs; i++){
      spine[i] = new PVector(0, segHt*i, 0);
      springs[i] = new PVector();
    }
  }

  // calculate and draw neck
  void create(){
    // calculate neck vertices
    for (int i=0; i<segs; i++){
      bones[i] = new PVector(loc.x+spine[i].x+w/2, loc.y+spine[i].y, loc.z+spine[i].z);
      bones[bones.length-1-i] = new PVector(loc.x+spine[i].x-w/2, loc.y+spine[i].y, loc.z+spine[i].z);
    }
    // draw neck shape
    beginShape();
    for (int i=0; i<bones.length; i++){
      vertex(bones[i].x, bones[i].y, bones[i].z);
    }
    endShape(CLOSE);
  }

  // set neck position
  void setLoc(PVector loc){
    this.loc = loc;
  }
  
  // overloaded set neck position
  void setLoc( float x, float y, float z ){
    loc.x = x;
    loc.y = y;
    loc.z = z;
  }

  // make neck/head bobble
  void bobble(){
    bobbleLead = sin(theta)*random(bobbleRangeMin, bobbleRangeMax);
    float[] deltaX = new float[spine.length];
    for (int i=0; i<spine.length; i++){
      deltaX[i] = (bobbleLead-spine[i].x)*(1.0/dist(spine[i].x, spine[i].y, bobbleLead, ht));
      springs[i].x += deltaX[i];
      spine[i].x += springs[i].x;
      springs[i].x *= damping;
    }
    theta += random(bobbleRateMin, bobbleRateMax);
    // position and rotate head
    head.setLoc(new PVector((bones[0].x+bones[1].x)/2, bones[0].y+ht/10, bones[0].z));
    head.setRot(radians(spine[spine.length-1].x));
    head.create();
  }

  void setFacing(float zSign){
    if (zSign>0){
      head.setFace(0);
    } 
    else {
      head.setFace(1);
    }
  }

  // controls bobble
  void setDynamics(float bobbleRangeMin, float bobbleRangeMax, float bobbleRateMin, float bobbleRateMax, float damping){
    this.bobbleRangeMin = bobbleRangeMin;
    this.bobbleRangeMax = bobbleRangeMax;
    this.bobbleRateMin = bobbleRateMin;
    this.bobbleRateMax = bobbleRateMax;
    this.damping = damping;
  }
}














