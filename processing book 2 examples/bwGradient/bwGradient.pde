// bwGradient.pde, chapter 9
void setup() {
size(400, 400);
loadPixels();
for (int i=0; i<pixels.length; i++) {
float gray = map(i, 0, pixels.length-1, 0, 255);
pixels[i] = color(gray);
}
updatePixels();
} // end setup()