// Sketch 7-10c: The WordTile class
class WordTile extends Word {
// A graphical tile containing a word and additional attributes
PVector location; // The top left corner of the tile (x, y)
float tileW, tileH; // width and height of the tile
color tileColor; // fill color of word
float tileFS = 24; // the font size of tile, default is 24
WordTile(String newWord) { // Constructor
super(newWord);
setSize();
location = new PVector(0, 0);
tileColor = color(0);
} // WordTile()
void setXY (float x, float y) {
location.x = x;
location.y = y;
} // setXY()
void setFontSize() {
tileFS = map(freq, 1, 30, 10, 120);
setSize();
} // setFontSize()
void setSize() {
textSize(tileFS);
tileW = textWidth(word);
tileH = textAscent();
} // setTileSize()
void display() {
fill(tileColor);
textSize(tileFS);
text(word, location.x, location.y);
} // display()
} // class WordTile