class Tile {
int sz; // size of tile
int x, y; // x, y coords of top left corner of tile
int orient; // orientation of tile, 0 or 1
boolean swapColors; // whether we should swap inside and outside colors
color ic; // inside color – fill color of arc if swapColor is false
color oc; // outside color – fill color of background square if swapColor is false
Tile(int x, int y, int w, color ic, color oc) {
this.x = x;
this.y = y;
sz = w;
this.ic = ic;
this.oc = oc;
orient = int(random(0, 1)); // only two unique orientations
} // end Tile()
void display() {
pushMatrix();
translate(x, y); // move to tile's x-y location (upper left corner)
noStroke();
if (swapColors) {
fill(ic);
}
else {
fill(oc);
}
rect(0, 0, sz, sz); // draw background square
translate(sz/2, sz/2); // move to the center of the tile
rotate(orient*PI/2); // rotate by the appropriate angle
translate(-sz/2, -sz/2); // move back to the upper left corner
stroke(255);
strokeWeight(3);
if (swapColors) {
fill(oc);
}
else {
fill(ic);
}
arc(0, 0, sz, sz, 0, PI/2);
arc(sz, sz, sz, sz, PI, 3*PI/2);
popMatrix();
} // end display()
} // end class Tile
// truchetSwap.pde, chapter 9
int tileSize = 100;
int rows = 10;
int cols = 10;
Tile[][] tiles = new Tile[rows][cols];
color ic = color(200, 100, 0); // orange
color oc = color(20, 100, 255); // blue
void setup() {
size(1000, 1000);
smooth();
for (int i=0; i < rows; i++) {
for (int j = 0; j < cols; j++) {
tiles[i][j] = new Tile(j*tileSize, i*tileSize, tileSize, ic, oc);
colorSwap(i, j);
tiles[i][j].display();
}
}
} // end setup()
// takes the row and column indices of the current tile and
// decides how to set its swapColor boolean variable
void colorSwap(int i, int j) {
if (i > 0 && j == 0) { // first tile of a row, starting from the 2nd row
// same orientation as tile directly above
if (tiles[i-1][0].orient == tiles[i][0].orient) {
// set to opposite coloring of my neighbor above
tiles[i][0].swapColors = !tiles[i-1][0].swapColors;
}
else {
// set to same coloring of my neighbor above
tiles[i][0].swapColors = tiles[i-1][0].swapColors;
}
}
if (j > 0) { // subsequent tiles in a row, including the first
// same orientation as tile to the left
if (tiles[i][j-1].orient == tiles[i][j].orient) {
// set to opposite coloring of my neighbor to the left
tiles[i][j].swapColors = !tiles[i][j-1].swapColors;
}
else {
// set to same coloring of my neighbor to the left
tiles[i][j].swapColors = tiles[i][j-1].swapColors;
}
}
} // end colorSwap()