Cat c1, c2, c3;

void setup (){
  c1 = new Cat();
  c1.wt = 27.5;
  c2 = new Cat();
  c2.wt = 14.345;
  println(c1.wt);
  println(c2.wt);
  c3 = new Cat(17.4, "persian", false, 9);
  
}