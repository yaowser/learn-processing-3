/**
 * Head class with customizable face
 * Running Amuck
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Head{
  // head faces
  PImage front, back, img;
  // head position
  PVector loc;
  float w, ht;
  int FRONT_FACE = 0, BACK_FACE = 1;
  // head rotation
  float headRot;

  // default constructor
  Head(){
  }

  // constructor - 2 images
  Head(PImage front, PImage back){
    this.front = front;
    this.back = back;
    img = front;
    init();
  }

  // constructor - 1 image
  Head(PImage img){
    this.img = img;
    init();
  }

  // size vertices to image
  void init(){
    loc = new PVector();
    w = img.width;
    ht = img.height;
  }

  // size vertices to image
  void setScale(float scl){
    // based on width of legs
    float sclFctr = scl/w;
    w *= sclFctr;
    ht *= sclFctr;
  }

  // size shape vertices to image
  void setSize(float w, float ht){
    this.w = w;
    this.ht = ht;
  }

  // update image
  void setImg(PImage img){
    this.img = img;
    init();
  }

  // set position
  void setLoc(PVector loc){
    this.loc = loc;
  }

  void setLoc( float x, float y, float z ){
    loc.x = x;
    loc.y = y;
    loc.z = z;
  }

  // set rotation
  void setRot(float headRot){
    this.headRot = headRot ;
  }

  // set head image based on z
  void setFace(int facing){
    if (facing == FRONT_FACE) {
      img = front;
    } 
    else {
      img = back;
    }
  }

  // create and move head
  void create(){
    textureMode(NORMAL);
    pushMatrix();
    // move and rotate head
    translate(loc.x, loc.y, loc.z);
    rotateZ(headRot);
    // draw rect and texture map face image
    beginShape();
    texture(img);
    vertex(- w/2, 0, 0, 0, 1.0);
    vertex(-w/2, -ht, 0, 0, 0);
    vertex(w/2, -ht, 1.0, 0);
    vertex(w/2, 0, 0, 1.0, 1.0);
    endShape();
    popMatrix();
  }
}