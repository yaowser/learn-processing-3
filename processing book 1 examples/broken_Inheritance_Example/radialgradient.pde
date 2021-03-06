class RadialGradient extends Gradient {
//default constructor
RadialGradient() {
super();
}
//constructor
RadialGradient(color c1, color c2) {
this.c1 = c1;
this.c2 = c2;
}
//constructor
RadialGradient(color c1, color c2, Rectangle bounds) {
this.c1 = c1;
this.c2 = c2;
this.bounds = bounds;
}
// required: implemented create method
void create(){
float px = 0, py = 0, angle = 0;
float radius1 = bounds.width/2;
float radius2 = bounds.height/2;
float centerX = bounds.x+radius1;
float centerY = bounds.y+radius2;
float radiusMax = max(radius1, radius2);
// calculate differences between color components
float deltaR = red(c2)-red(c1);
float deltaG = green(c2)-green(c1);
float deltaB = blue(c2)-blue(c1);
// gapFiller ensures there are no holes in gradient
float gapFiller = 8.0;
for (int i=0; i<radiusMax; i++){
for (float j=0; j<360; j+=1.0/gapFiller){
if (radius1>radius2){
px = centerX+cos(radians(angle))*i;
py = centerY+sin(radians(angle))*(i-(radius1-radius2));
}
else {
px = centerX+cos(radians(angle))*(i-(radius2-radius1));
py = centerY+sin(radians(angle))*i;
}
angle+=1.0/gapFiller;
color c = color( 
(red(c1)+(i)*(deltaR/radiusMax)), 
(green(c1)+(i)*(deltaG/radiusMax)), 
(blue(c1)+(i)*(deltaB/radiusMax)) );
set(int(px), int(py), c);
}
}
}
}