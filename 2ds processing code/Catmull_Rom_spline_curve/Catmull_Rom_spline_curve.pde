// Catmull-Rom spline curve
void setup() {

size(500, 500);
background(255);
Point p0 = new Point(150, 100);
Point p1 = new Point(350, 100);
Point p2 = new Point(350, 300);
Point p3 = new Point(150, 300);
Point p4 = new Point(100, 400);
//curve segments
curve(p4.x, p4.y, p0.x, p0.y, p1.x, p1.y, p2.x, p2.y);
curve(p0.x, p0.y, p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
curve(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
curve(p2.x, p2.y, p3.x, p3.y, p4.x, p4.y, p0.x, p0.y );
//control points
ellipse(p0.x, p0.y, 10, 10);
ellipse(p1.x, p1.y, 10, 10);
ellipse(p2.x, p2.y, 10, 10);
ellipse(p3.x, p3.y, 10, 10);
ellipse(p4.x, p4.y, 10, 10);
}