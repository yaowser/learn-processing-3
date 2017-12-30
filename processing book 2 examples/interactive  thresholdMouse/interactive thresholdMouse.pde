// thresholdMouse.pde, chapter 10
PImage img;
void setup() {
img = loadImage("2017-12-21.jpg");
size(512, 384);
image(img, 0, 0);
} // end setup()
void draw() {} // must include draw() for mouse callbacks
void mouseDragged() {
float t = map(mouseY, 0, height, 0.0, 1.0); // map mouse y-position to 0.0-1.0
image(img, 0, 0); // redraw screen with the original
filter(THRESHOLD, t); // filter with new threshold level
} // end mouseDragged()