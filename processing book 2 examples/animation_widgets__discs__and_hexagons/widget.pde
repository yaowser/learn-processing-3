abstract class widget {
// Every shape has a x-, y- location, size, and color
PVector location;
float sz;
color col;
widget() {
this(new PVector(random(width), random(height)), 30, color(0));
} // widget()
widget(PVector loc, float s, color c) {
location = loc;
sz = s;
col = c;
} // widget()
// Every shape can be displayed
abstract void display();
// Every shape can move
abstract void move();
// Set the speed at which the widget moves
abstract void setSpeed(PVector s);
} // class widget