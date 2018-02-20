// https://docs.google.com/spreadsheets/d/1GZ1PWba2SZfmn9685WF_RVbblvG_9G45j3TBbmXSZkc/edit#gid=0

import java.util.Iterator;
ArrayList<Rain> rain = new ArrayList<Rain>();
HashMap<Integer,PVector> hm = new HashMap<Integer,PVector>();
int num = 200;
int boundaryRadius = 60;


void setup() {
  //fullScreen();
  size(600,600);
  //frameRate(2);
  ellipseMode(CENTER);
  colorMode(HSB);
  //stroke(255);
  noStroke();
}

void draw() {
  background(0);
  if(rain.size() < num) {
    rain.add(new Rain());
  }
  
  int end = rain.size();
  
  // get all positions, stick them in a PVector[] array
  PVector[] positions = new PVector[rain.size()];
  for(int m = 0; m<end; m++) {
    positions[m] = rain.get(m).location();
  }
  println(positions);
  
  
  
  
  for(int i = 0; i<end; i++) {
    for(int j = i+1; j<end; j++) {
      for(int k = j + 1; k<end; k++) {
      PVector a = rain.get(i).location();
      PVector b = rain.get(j).location();
      PVector c = rain.get(k).location();
      float v = rain.get(i).hue;
      // if the distance between these two raindrops is less than boundaryRadius
      // draw a line segment connecting them
      if(PVector.dist(a,b) < boundaryRadius 
      && PVector.dist(a,c) < boundaryRadius
      && PVector.dist(b,c) < boundaryRadius){
        //line(a.x,a.y,b.x,b.y);
        fill(v,360,360,v);
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
  //float life = 255;
  float hue = random(120,200);
  
  Rain() {
    loc = new PVector(random(width),-10);
    vel = new PVector(0,random(1,5));
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
    //ellipse(loc.x,loc.y,6,6);
    
  }
  
  boolean isDead() {
    if(loc.y > height+10) {
      return true;
    }else {
      return false;
    }
  }
  
}