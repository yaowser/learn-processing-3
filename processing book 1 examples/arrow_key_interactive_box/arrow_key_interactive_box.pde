int x, y;
void setup(){
size(200, 200);
}
void draw() {
stroke(0, 50);
fill(255, 50);
rect(width/2+x, height/2+y, 4+x, 4+y);
}
void keyPressed() {
  if(key == CODED) {
if (keyCode == UP) {
y--;
} else if (keyCode == DOWN) {
y++;
} else if (keyCode == LEFT) {
x--;
} else if (keyCode == RIGHT) {
x++;
}
}
}