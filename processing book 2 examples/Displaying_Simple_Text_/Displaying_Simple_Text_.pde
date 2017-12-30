// Sketch 7-5: Displaying Simple Text.
String sentence = "A man, a plan, a canal, Panama.";
void setup() {
size(400, 100);
smooth();
} // setup()
void draw() {
background(200);
fill(0);
textSize(24);
text(sentence, 10, height/2);
} // draw()