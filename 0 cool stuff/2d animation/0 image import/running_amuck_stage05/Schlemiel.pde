/**
 * Schlemiel class
 * Running Amuck
 * - composite class manages components
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */
class Schlemiel{

  PVector loc;
  Legs legs;
  Neck neck;
  PVector minBounds, maxBounds;

  // default constructor
  Schlemiel(){
  }

  // constructor
  Schlemiel(Neck neck, Legs legs){
    this.legs = legs;
    this.neck = neck;
    init();
  }

  // set some defaults
  void init(){
    neck.setSize(legs.w/4.0, legs.ht/2.0);
    minBounds = new PVector(0, 0, -1000);
    maxBounds = new PVector(0, 0, 600);
    neck.setDynamics(legs.w/4, legs.w/2, PI/180, PI/60, .97);
  }

  void setLoc(PVector loc){
    this.loc = loc;
  }

  void setLegs(Legs legs){
    this.legs = legs;
  }

  void setNeck(Neck neck){
    this.neck = neck;
  }

  // set limits of movement
  void setMotionBounds(PVector minBounds, PVector maxBounds){
    this.minBounds = minBounds;
    this.maxBounds = maxBounds;
  }

  void create(){
    legs.create();
    neck.create();
  }

  void move(){
    // move legs
    legs.stride();
    legs.move(minBounds.z, maxBounds.z);
    // position neck on legs
    neck.setLoc(legs.loc.x, legs.loc.y-legs.ht-neck.ht+neck.ht/5, legs.loc.z);
    // make neck wave

    neck.bobble();
    // change face based on direction legs are moving
    neck.setFacing(legs.getStrideSpeed());
  }
}


