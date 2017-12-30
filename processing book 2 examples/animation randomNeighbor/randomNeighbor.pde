// randomNeighbor.pde, chapter 9
PImage img;
void setup() {
img = loadImage("2017-12-21.jpg");
size(512, 384);
image(img, 0, 0);
} // end setup()
void draw() {
for (int y = 1; y < img.height-1; y++) {
for (int x = 1; x < img.width-1; x++) {
int newX = randInt(x-1, x+1);
int newY = randInt(y-1, y+1);
set(x, y, get(newX, newY));
}
}
} // end draw()
// returns a randomly generated integer between low and high, including low and high
int randInt(int low, int high) {
int r = floor(random(low, high+1));
//Processing's random(low, high) occasionally returns high,
//even though the references say it doesn't
r = constrain(r, low, high);
return r;
} // end randInt()