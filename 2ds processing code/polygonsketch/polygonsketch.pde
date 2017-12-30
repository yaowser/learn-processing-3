void setup(){
  size(800,800);
  background(255,255,0);
  noFill();
  int polyCount=300;
  float maxSideCount = 100;
  for(int i=0;i<polyCount;i++){
    int sideCount = int(random(3, maxSideCount));
    float radius=random(25,width/2.5);
    float rotation=random(TWO_PI);
    pushMatrix();
    strokeWeight(sideCount);
    stroke(sideCount*8,random(255),random(255),random(20,255));
    translate(width/2+random(-60,60),height/2+random(-60,60));
    rotate(rotation);
    if(i%3==0){
      new Polygon(this, sideCount,radius);
    }
    strokeWeight(random(.75,20.5));
    stroke(255,255,0);
    new Polygon(this,int(random(3,6)),radius*5);
    popMatrix();
  }
}