// Sketch 7-8: Displaying Simple Text using attributes
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
line(10, height/2, 10+textWidth(sentence), height/2);
} // draw()