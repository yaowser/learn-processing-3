// sketch using a nice parameterized function
void setup(){
size(200, 200);
background(255);
createRect(50, 50, 100, 100, 20, 5, 100);
}
// parameterized function
void createRect(int xpos, int ypos, int wdth,
int ht, int strokeCol,
int strokeWt, int fillCol) {
stroke(strokeCol);
strokeWeight(strokeWt);
fill(fillCol);
rect (xpos, ypos, wdth, ht);
}