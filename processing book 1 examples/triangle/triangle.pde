//Triangle
Point[]p = new Point[3];
void setup(){
size(400, 400);
background(190);
p[0] = new Point(2, height-2);
p[1] = new Point(width-2, height-2);
p[2] = new Point(width/2, 2);
stroke(0);
strokeWeight(2);
fill(225);
triangle(p[0].x, p[0].y, p[1].x, p[1].y, p[2].x, p[2].y);
}