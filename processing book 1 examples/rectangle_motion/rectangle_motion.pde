//linear motion
int w = 20;
int h = 10;
int x = 0;
int y;
void setup(){
size(400, 400);
y = height/2;
frameRate(30);
}
void draw(){
background(255);
rect(x++, y, w, h);
}