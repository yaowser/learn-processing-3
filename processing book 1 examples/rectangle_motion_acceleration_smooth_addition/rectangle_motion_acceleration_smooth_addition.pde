// Example 2:
// accelerated motion using addition
int w = 10;
int h = 10;
int x = 0;
int y;
float speed;
float acceleration = .1;
void setup(){
size(400, 400);
y = height/2;
}
void draw(){
background(255);
speed += acceleration;
rect(x+=speed, y, w, h);
}