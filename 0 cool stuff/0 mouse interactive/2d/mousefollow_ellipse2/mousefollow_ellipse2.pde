// Ravenous Ellipse II
float x, y;
float easing = .05;
void setup(){
size(400, 400);
x = width/2;
y = height/2;
smooth();
}
void draw(){
// repaint background
fill(255, 40);
rect(0, 0, width, height);
/* find distance for x and y
between prey and predator */
float deltaX = (pmouseX-x);
float deltaY = (pmouseY-y);
// cause the predator to decelerate
deltaX *= easing;
deltaY *= easing;
x += deltaX;
y += deltaY;
ellipse(x, y, 15, 15);
}