void setup (){
  size(800,800);
  background(255);
  ellipse(width/2,height/2,5,5);
  createArcs();
}

void createArcs(){
  //x,y,w,h,start,stop
  arc(width/2, height/2, 100, 100, 0, PI/2);
}