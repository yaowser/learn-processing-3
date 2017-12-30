class Shape {
  PVector loc;
  color fillCol;
  float radius;
  
  Shape (){
  }
  
  Shape (PVector loc, color fillCol, float radius) {
    this.loc=loc;
    this.fillCol=fillCol;
    this.radius=radius;
  }
  
  void construct() {
    println("in shape construct");
  }
  
  void move () {
    println("in shape move");
  }
  
  void display () {
    println("in shape display");
  }
  
}