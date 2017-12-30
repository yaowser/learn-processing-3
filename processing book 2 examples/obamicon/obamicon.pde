//obamicon.pde, chapter 10
void setup() {
PImage img = loadImage("2017-12-21.jpg");
color darkBlue = color(0, 51, 76);
color red = color(217, 26, 33);
color lightBlue = color(112, 150, 158);
color yellow = color(252, 227, 166);
size(512, 384);
img.loadPixels();
for (int i = 0; i < img.pixels.length; i++) {
color c = img.pixels[i];
float total = red(c)+green(c)+blue(c);
if (total < 182) { // darkest colored pixels
img.pixels[i] = color(darkBlue);
}
else if (total < 364) { // 2nd darkest pixels
img.pixels[i] = color(red);
}
else if (total < 546) { // lighter pixels
img.pixels[i] = color(lightBlue);
}
else { // lightest pixels
img.pixels[i] = color(yellow);
}
}
img.updatePixels();
image(img, 0, 0);
} // end setup()