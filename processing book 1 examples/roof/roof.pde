// Drawing Some Roofs
void setup(){
size(400, 150);
background(200);
smooth();
Roof roof1 = new Roof();
roof1.drawRoof(25, 100, 100, 150);
Roof roof2 = new Roof(Roof.GAMBREL);
roof2.drawRoof(150, 100, 100, 150);
Roof roof3 = new Roof(Roof.DOME);
roof3.drawRoof(275, 100, 100, 100);
}
class Roof{
//roof properties
int x;
int y;
int w;
int h;
// roof style
int style = 0;
//constants
final static int CATHEDRAL = 0;
final static int GAMBREL = 1;
final static int DOME = 2;
// default constructor
Roof(){
}
// constructor 2
Roof(int style){
this.style = style;
}
// draw the roof
void drawRoof(int x, int y, int w, int h) {
switch(style){
case 0:
beginShape();
vertex(x, y);
vertex(x+w/2, y-h/3);
vertex(x+w, y);
endShape(CLOSE);
break;
case 1:
beginShape();
vertex(x, y);
vertex(x+w/7, y-h/5);
vertex(x+w/2, y-h/2.75);
vertex(x+(w-w/7), y-h/5);
vertex(x+w, y);
endShape(CLOSE);
break;
case 2:
ellipseMode(CORNER);
arc(x, y-h/2, w, h, PI, TWO_PI);
line(x, y, x+w, y);
break;
}
}
// set roof style
void setStyle(int style){
this.style = style;
}
}