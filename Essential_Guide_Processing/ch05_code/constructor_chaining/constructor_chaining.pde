// superclass constructor chaining example
void setup(){
  new Child();
  new Child("ira");
}

class Parent{
  //default constructor
  Parent(){
    println("Parent default constructor called");
  }
  //default constructor
  Parent(String n){
    println("Parent constructor called for " + n);
  }
}

class Child extends Parent{
  //default constructor
  Child(){
    // explicitly call a superclass constructor 1st
    super();
    println("Child default constructor called");
  }
  // constructor
  Child(String name){
    // explicitly call a superclass constructor 1st
    super(name);
    println("Child constructor called");
  }
}


