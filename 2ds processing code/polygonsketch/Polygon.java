import processing.core.*;

class Polygon {
  PApplet p; 
    int sideCount;
    float radius;
    
    Polygon (){
    }
    Polygon(PApplet p , int sideCount, float radius){
      this.p=p; 
      this.sideCount=sideCount;
      this.radius=radius;
      float theta=0.0f;
      float x=0.0f,y=0.0f;
      p.beginShape();
      for(int i =0;i<sideCount;i++){
        x=p.cos(theta)*radius;
        y=p.sin(theta)*radius;
        p.vertex(x,y);
        theta += p.TWO_PI/sideCount;
        theta += p.TWO_PI/sideCount;
      }
      p.endShape(p.CLOSE);
    }
}