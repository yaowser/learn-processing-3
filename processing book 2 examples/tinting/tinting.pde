// tinting.pde, chapter 10
void setup() {
PImage img = loadImage("2017-12-21.jpg");
size(1024, 768); // 2 times as wide as and 2 times as high as the original image
tint(200, 100, 0); // orange
image(img, 0, 0);
tint(0, 100, 200); // blue
image(img, img.width, 0); // display at x offset img.width
tint(100, 100, 200); // purple
image(img, 0, img.height);
tint(200, 200, 100); // yellow
image(img, img.width, img.height);
} // end setup()