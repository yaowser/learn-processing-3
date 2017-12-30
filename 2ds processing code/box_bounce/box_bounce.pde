float x=100;
float y=100;
float speedX=4.125;
float speedY=2;

void setup(){
  size(800,600);
  background(255);

}

void draw(){
  background(255);
  rect(x,y,30,30);
  x = x+speedX;
  y = y+speedY;
  if (x>=width){
    speedX= -speedX;
  }
    if (x<=0){
    speedX= -speedX;
  }
    if (y>=height){
    speedY= -speedY;
  }
    if (y<=0){
    speedY= -speedY;
  }
}