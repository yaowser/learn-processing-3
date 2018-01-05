//Triangle Blur
Point[]p = new Point[3];
float shift = 2;
float fade = 0;
float fillCol = 0;
void setup(){
size(400, 400);
background(0);
smooth();
fade = 255.0/(width/2.0/shift);
p[0] = new Point(1, height-1);
p[1] = new Point(width-1, height-1);
p[2] = new Point(width/2, 1);
noStroke();
triBlur();
}
void triBlur(){
fill(fillCol);
fillCol+=fade;
triangle(p[0].x+=shift, p[0].y-=shift/2, p[1].x-=shift, 
p[1].y-=shift/2, p[2].x, p[2].y+=shift);
if(p[0].x<width/2){
// recursive call
triBlur();
}
}