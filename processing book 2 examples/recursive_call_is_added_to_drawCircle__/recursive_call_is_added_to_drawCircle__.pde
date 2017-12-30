//draw a circle of size radius s at x, y, s>2
void drawCircle(int x, int y, int s) {
if (s>2) {
ellipse(x, y, s, s);
drawCircle(x-s/2, y, s/2); // recursive call
}
}// end drawCircle()
void setup() {
size(800, 800);
background(255);
smooth();
noFill();
translate(width/2, height/2); // move to the middle of the screen
drawCircle(0, 0, width/2); // draws a circle half size of the screen width
} // end setup()