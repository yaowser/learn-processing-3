class Burst extends Shape{
  
  float pointRadius;
  
  Burst () {
    super();
  }
    
  Burst (PVector loc, color fillCol, float radius, float pointRadius) {
    super(loc,  fillCol,  radius);
    this.pointRadius=pointRadius;
  }
  
  void construct() {
    println("in burst construct override");
  }
}