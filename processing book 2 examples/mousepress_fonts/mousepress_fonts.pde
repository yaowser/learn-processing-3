// Sketch 7-7: List of fonts
String[] fonts;
PFont font;
int N, i;
void setup() {
size(500, 500);
background(255);
fonts = PFont.list();
N = fonts.length;
i = 0;
println("There are "+N+" fonts installed.");
} // setup()
void draw() {
} // draw()
void mousePressed() {
font = createFont(fonts[i], 24);
textFont(font);
fill(0);
text(fonts[i], mouseX, mouseY);
i++;
} // mousePressed()