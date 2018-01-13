/**
 * Draw Game
 * Shape class - convenience class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */
 
 class Shape {
  
  // instance properties
  float x;
  float y;
  float w;
  float h;
  
  // default constructor
  Shape(){
  }
  
  // constructor
  Shape(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  // setters
  void setLoc(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void setSize(float w, float h){
    this.w = w;
    this.h = h;
  }
  
}
