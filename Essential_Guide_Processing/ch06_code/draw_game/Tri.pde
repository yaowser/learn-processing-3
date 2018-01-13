/**
 * Draw Game
 * Tri class - convenience triangle class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Tri{
  PVector[] vecs = new PVector[3];

  // default constructor
  Tri(){
  }

  // constructor
  Tri(PVector v0, PVector v1, PVector v2){
    vecs[0] = v0;
    vecs[1] = v1;
    vecs[2] = v2;
  }

  // setter
  void setVecs(PVector[] vecs){
    this.vecs = vecs;
  }
}



