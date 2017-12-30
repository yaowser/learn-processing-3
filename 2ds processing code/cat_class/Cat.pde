class Cat {
  float wt;
  String breed;
  boolean isLongHair;
  int age;
  Cat () {
    

  }
  
  Cat (float wt, String Breed) {
    this.wt = wt;
    this.breed = breed;
  }
  Cat (float wt, String Breed,boolean isLongHair, int age) {
    this.wt = wt;
    this.breed = breed;
    this.isLongHair = isLongHair;
    this.age = age;
    println("in cstr");
  }
  void move() {
    
  }
  void eat(){
    
  }
  void speak () {
    
  }
  void setWt(float wt){
    this.wt = wt;
  }
  float getWt() {
    return wt;
    
  }
}