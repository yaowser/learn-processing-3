abstract class Gradient {
// constants
// these can't be changed
final static int AXIS_VERTICAL = 0;
final static int AXIS_HORIZONTAL = 1;
// instance fields with default values
// these can be changed
color c1 = color(255);
color c2 = color(0);
Rectangle bounds = new Rectangle(0, 0, width, height);
// abstract method, to be implmented by subclasses
abstract void create();
/* concrete methods*/
//getter/setters
void setColor1(color c1){
this.c1 = c1;
}
color getColor1(){
return c1;
}
void setColor2(color c2){
this.c2 = c2;
}
color getColor2(){
return c2;
}
void setBounds(Rectangle Bounds){
this.bounds = bounds;
}
Rectangle getBounds(){
return bounds;
}
}