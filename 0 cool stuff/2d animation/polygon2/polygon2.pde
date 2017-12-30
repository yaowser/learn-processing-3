float x,y,speedX=5,speedY=2.75,radius=30;

void setup(){
  size(800,700);
  x=width/2;
  y=height/2;
}

void draw(){
  background(255);
  noFill();
  
  for(int i = 0; i <6; i++){
    polygon(i*3,i+3,2,color(200 - i*3,200,0));
  }
  //speedY++;
  x=x+speedX;
  y=y+speedY;
  checkCollision();
}

  
void checkCollision(){
  if (x>width-radius){
    speedX=-speedX;
  }
  if (x<radius){
    speedX=-speedX;
  }
    if (y>height-radius){
    speedY=-speedY;
  }
  if (y<radius){
    speedY=-speedY;
  }
}