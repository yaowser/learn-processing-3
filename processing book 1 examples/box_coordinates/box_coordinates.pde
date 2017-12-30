// Processing Object-Oriented approach: Create a rectangle
void setup(){
// set display window to 400 x 400
size(400, 400);
// set background color to light gray
background(225);
//instantiate a MyRect object and assign it to the reference variable rectangle1
MyRect rectangle1 = new MyRect(width/8, height/8, width/4, height/4, 200, -1);
/* call drawRect() method using MyRect object reference, rectangle1
calls the method using dot syntax (literally
the period between the object and the method call).*/
rectangle1.drawRect();
}
// MyRect class definition
class MyRect {
// public instance fields - each MyRect object will have
// their own set of these properties
float x, y, wdth, ht;
int fillCol, strokeCol;
/*constructor - called when the object is instantiated, using the new
operator. the parameter list between the parentheses needs to match
the argument list in the instantiation call */
MyRect(float x, float y, float wdth, float ht, int fillCol, int strokeCol){
// initialize instance fields - assignment happens form
// right to left, e.g. the value of x is assigned to the
// instance property this.x
this.x = x;
this.y = y;
this.wdth = wdth;
this.ht = ht;
this.fillCol = fillCol;
/* check for stroke - if the last argument passed to the
constructor is not -1 then use that value to set the
stroke color. If it is -1, don't draw a stroke */
if (strokeCol!=-1){
this.strokeCol = strokeCol;
stroke(strokeCol);
}
else {
noStroke();
}
}
//drawRect method
void drawRect(){
//assign fill color
fill(fillCol);
// draw rectangle
rect(x, y, wdth, ht);
}
}