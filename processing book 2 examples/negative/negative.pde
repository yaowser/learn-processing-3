// negative.pde, chapter 9
void setup() {
PImage img = loadImage("2017-12-21.jpg");
size(512, 384);
image(img, 0, 0);
for (int y = 0; y < img.height; y++) {
for (int x = 0; x < img.width; x++) {
color c = get(x, y);
set(x, y, color(255-red(c), 255-green(c), 255-blue(c)));
}
}
} // end setup()