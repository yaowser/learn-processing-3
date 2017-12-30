
float birthRate =.4;
float particleCountCurrent =0;
int particleCount = 300;
float[] x = new float[particleCount];
float[] y= new float[particleCount];
int[] sideCount = new int[particleCount];
float[] radius= new float[particleCount];
float[] speedX= new float[particleCount];
float[] speedY= new float[particleCount];
float[] gravity = new float[particleCount];
float[] damping = new float[particleCount];
float[] friction = new float[particleCount];

void setup(){
  size(800,600);
  for (int i=0; i<particleCount; i+=1){
    //x[i]=random(100,width-100);
    x[i]=width/2;
    //y[i]=random(100,height-100);
    y[i]=50;
    speedX[i]=random(-2.2,2.2);
    speedY[i]=random(-2,-40);
    radius[i]=random(5,10);
    gravity[i]=0.9;
    damping[i]=0.77;
    friction[i]=0.77;
    sideCount[i]=int(random(3,10));
  }

  
}

void draw(){
  background(0);
  fill(0,20);
  noStroke();
  rect(-1,-1,width+1,height+1);
  for (int i=0; i<particleCountCurrent; i+=1){
    polygon(x[i],y[i],radius[i], sideCount[i], 2, color(255,0,0));
    x[i] += speedX[i] + random(-3,3);
    speedY[i] += gravity[i];
    y[i] +=speedY[i];
    checkCollision(i);
  }
  if(particleCountCurrent < particleCount - birthRate) {
    particleCountCurrent += birthRate;
  }
}

  
void checkCollision(int i){
  if (x[i]>width-radius[i]){
    x[i]=width-radius[i];
    speedX[i]=-speedX[i];
  }
  if (x[i]<radius[i]){
    x[i]=radius[i];
    speedX[i]=-speedX[i];
  }
    if (y[i]>height-radius[i]){
    y[i]=height-radius[i];
    speedY[i]=-speedY[i];
    speedY[i] *=damping[i];
    speedX[i] *=friction[i];
  }
  if (y[i]<radius[i]){
    y[i]=radius[i];
    speedY[i]=-speedY[i];
  }
}