//Triangle Zoom
Point[]p = new Point[3];
float shift = 10;
void setup(){
size(400, 400);
background(190);
smooth();
p[0] = new Point(1, height-1);
p[1] = new Point(width-1, height-1);
p[2] = new Point(width/2, 1);
stroke(0);
strokeWeight(1);
fill(225);
triangle(p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y);
triBlur();
}
void triBlur(){
triangle(p[0].x+=shift, p[0].y-=shift/2, p[1].x-=shift, 
p[1].y-=shift/2, p[2].x, p[2].y+=shift);
if(p[0].x<width/2){
// recursive call
triBlur();
}
}