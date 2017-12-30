// Sketch 7-6: Displaying Text in a Specific Font
String sentence = "A man, a plan, a canal, Panama.";
PFont tnr;
void setup() {
size(400, 100);
smooth();
tnr = createFont("Times New Roman", 48);
println(PFont.list());
} // setup()
void draw() {
background(200);
fill(0);
textFont(tnr);
textSize(24);
text(sentence, 10, height/2);
} // draw()