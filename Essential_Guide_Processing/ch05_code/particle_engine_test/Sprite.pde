/**
 * Sprite class
 * Particle Engine
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */
 
 // Base class for Particles and Colliders
class Sprite {

  // instance properties
  // location
  PVector loc = new PVector();
  // size
  float w = 1.0;
  float ht = 1.0;
  float radius = 1.0;

  // color
  color col;

  // default constructor
  Sprite(){
  }

  // constructor
  Sprite(float w, float ht){
    this.w = w;
    this.ht = ht;
  }

  // constructor
  Sprite(float radius){
    this.radius = radius;
  }

  // constructor
  Sprite(float w, float ht, color col){
    this.w = w;
    this.ht = ht;
    this.col = col;
  }

  // constructor
  Sprite(PVector loc, float radius, color col){
    this.loc = loc;
    this.radius = radius;
    this.col = col;
  }

  // constructor
  Sprite(float radius, color col){
    this.radius = radius;
    this.col = col;
  }

  // constructor
  Sprite(color col){
    this.col = col;
  }

  // instance methods
  // this will most likely be overridden in child classes
  void create(){
    fill(col);
    rectMode(CENTER);
    rect(0, 0, radius*2, radius*2);
  }

  // setters
  void setLoc(){
    this.loc = loc;
  }

  void setSize(float radius){
    this.radius = radius;
  }

  void setSize(float w, float ht){
    this.w = w;
    this.ht = ht;
  }

  void setCol(color col){
    this.col = col;
  }

}


