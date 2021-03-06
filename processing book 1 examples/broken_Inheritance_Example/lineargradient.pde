class LinearGradient extends Gradient {
int axis;
//default constructor
LinearGradient() {
axis = AXIS_VERTICAL;
}
//constructor
LinearGradient(color c1, color c2) {
this.c1 = c1;
this.c2 = c2;
axis = AXIS_VERTICAL;
}
//constructor
LinearGradient(color c1, color c2, Rectangle bounds) {
this.c1 = c1;
this.c2 = c2;
this.bounds = bounds;
axis = AXIS_VERTICAL;
}
//constructor
LinearGradient(color c1, color c2, Rectangle bounds, int axis) {
this.c1 = c1;
this.c2 = c2;
this.bounds = bounds;
this.axis = axis;
}
// required: implemented create method
void create(){
// calculate differences between color components
float deltaR = red(c2)-red(c1);
float deltaG = green(c2)-green(c1);
float deltaB = blue(c2)-blue(c1);
// y axis
if(axis == AXIS_VERTICAL){
for (int i=bounds.x; i<=(bounds.x+bounds.width); i++){
for (int j=bounds.y; j<=(bounds.y+bounds.height); j++){
color c = color( 
(red(c1)+(j-bounds.y)*(deltaR/bounds.height)), 
(green(c1)+(j-bounds.y)*(deltaG/bounds.height)), 
(blue(c1)+(j-bounds.y)*(deltaB/bounds.height)) );
set(i, j, c);
}
}
}
// x axis
else {
for (int i=bounds.y; i<=(bounds.y+bounds.height); i++){
for (int j=bounds.x; j<=(bounds.x+bounds.width); j++){
color c = color( 
(red(c1)+(j-bounds.x)*(deltaR/bounds.width)), 
(green(c1)+(j-bounds.x)*(deltaG/bounds.width)), 
(blue(c1)+(j-bounds.x)*(deltaB/bounds.width)) );
set(j, i, c);
}
}
}
}
void setAxis(int axis){
this.axis = axis;
}
int getAxis(){
return axis;
}
}