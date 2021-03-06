/*
Inheritance Example
linear and radial gradients
January 25, 2006
NOTE: This sketch takes some time to render.
REQUIRED: Gradient class, LinearGradient class and
RadialGradient class.
*/
void setup(){
size(400, 400);
// fill display window with default black and white
// linear gradient background
LinearGradient lg = new LinearGradient();
lg.create();
//create 4 linear Gradients
color c1 = color(255, 0, 0);
color c2 = color(0, 255, 0);
color c3 = color(255, 255, 0);
color c4 = color(180, 0, 255);
color c5 = color(255, 127, 0);
color c6 = color(0, 0, 255);
color c7 = color(0, 255, 255);
color c8 = color(255, 180, 0);
Rectangle r1 = new Rectangle(50, 50, 150, 150);
Rectangle r2 = new Rectangle(200, 50, 150, 150);
Rectangle r3 = new Rectangle(50, 200, 150, 150);
Rectangle r4 = new Rectangle(200, 200, 150, 150);
LinearGradient lg1 = new LinearGradient(c1, c2, r1, 
Gradient.AXIS_HORIZONTAL);
lg1.create();
LinearGradient lg2 = new LinearGradient(c3, c4, r2);
lg2.create();
LinearGradient lg3 = new LinearGradient(c5, c6, r3);
lg3.create();
LinearGradient lg4 = new LinearGradient(c7, c8, r4, 
Gradient.AXIS_HORIZONTAL);
lg4.create();
//create 4 radial Gradients
c1 = color(0, 150, 200);
c2 = color(200, 200, 100);
c3 = color(190, 225, 290);
c4 = color(90, 45, 20);
c5 = color(195, 195, 90);
c6 = color(30, 10, 70);
c7 = color(0);
c8 = color(255);
r1 = new Rectangle(60, 60, 130, 130);
r2 = new Rectangle(225, 60, 100, 130);
r3 = new Rectangle(60, 225, 130, 100);
r4 = new Rectangle(210, 210, 130, 130);
RadialGradient rg1 = new RadialGradient(c1, c2, r1);
rg1.create();
RadialGradient rg2 = new RadialGradient(c3, c4, r2);
rg2.create();
RadialGradient rg3 = new RadialGradient(c5, c6, r3);
rg3.create();
RadialGradient rg4 = new RadialGradient(c7, c8, r4);
rg4.create();
}