// Drawing with OOP
// object (reference) variable
Rectangle r1;
void setup(){
size(400, 400);
background(255);
// create new rectangle object
r1 = new Rectangle(100, 200, 150, 150);
}
// class description
class Rectangle {
//class constructor
Rectangle(int x, int y, int w, int h) {
rect(x, y, w, h);
}
}