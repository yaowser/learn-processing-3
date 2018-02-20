import java.util.Iterator;
ArrayList<Rain> rain;
int num = 2000;
int boundaryRadius = 80;


void setup() {
  size(850,750,P2D);
  rain = new ArrayList<Rain>();
  frameRate(60);
  ellipseMode(CENTER);
}

void draw() {
  background(0);
  if(rain.size() < num) {
    rain.add(new Rain());
  }
  
  int end = rain.size();
  for(int i = 0; i<end; i++) {
    for(int j = i+1; j<end; j++) {
      for(int k = j + 1; k<end; k++) {
      PVector a = rain.get(i).location();
      PVector b = rain.get(j).location();
      PVector c = rain.get(k).location();
      // if the distance between these two raindrops is less than boundaryRadius
      // draw a line segment connecting them
      if(PVector.dist(a,b) < boundaryRadius 
      && PVector.dist(a,c) < boundaryRadius
      && PVector.dist(b,c) < boundaryRadius){
        //line(a.x,a.y,b.x,b.y);
        fill(random(200),0,0,random(50,255));
        triangle(a.x,a.y,b.x,b.y,c.x,c.y);
      }
     }
    }
  }
  
  Iterator<Rain> ip = rain.iterator();
  while(ip.hasNext()) {
    Rain r = ip.next();
    r.run();
    if(r.isDead()) {
      ip.remove();
    }
  }
  
}
  

class Rain {
  PVector loc;
  PVector vel;
  float life = 255; 
  PVector[] pos;
  
  Rain() {
    loc = new PVector(random(width),-10);
    vel = new PVector(0,random(1.5,5));
  }
  
  void run() {
    update();
    display();
  }
  
  void update() {
    loc.add(vel);   
  }
  
  PVector location() {
   return loc; 
  }
  
  void display() {
    fill(255);
    ellipse(loc.x,loc.y,6,6);
    stroke(255);
  }
  
  boolean isDead() {
    if(loc.y > height+10) {
      return true;
    }else {
      return false;
    }
  }
  
}