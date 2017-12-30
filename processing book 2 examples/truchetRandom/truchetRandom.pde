// truchetRandom.pde, chapter 9
int tileSize = 24;
int rows = 35;
int cols = 35;
Tile[][] tiles = new Tile[rows][cols];
void setup() {
size(840, 840);
smooth();
background(255);
for (int i=0; i < rows; i++) {
for (int j = 0; j < cols; j++) {
tiles[i][j] = new Tile(j*tileSize, i*tileSize, tileSize);
tiles[i][j].display();
}
}
} // end setup()
class Tile {
int sz; // size of tile
int x, y; // x, y coords of top left corner of tile
int orient; // orientation of tile
Tile(int x, int y, int w) {
this.x = x;
this.y = y;
sz = w;
orient = int(random(0, 3));
} // end Tile()
void display() {
pushMatrix();
translate(x, y); // move to tile's x-y location (upper left corner)
translate(sz/2, sz/2); // move to the center of the tile
rotate(orient*PI/2); // rotate by the appropriate angle
translate(-sz/2, -sz/2); // move back to the upper left corner
fill(0);
triangle(sz, 0, sz, sz, 0, sz);
popMatrix();
} // end display()
} // end class Tile