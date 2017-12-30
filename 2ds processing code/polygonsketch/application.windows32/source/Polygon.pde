class Polygon {
    int sideCount;
    float radius;
    
    Polygon (){
    }
    Polygon(int sideCount, float radius){
      this.sideCount=sideCount;
      this.radius=radius;
      float theta=0.0f;
      float x=0.0f,y=0.0f;
      beginShape();
      for(int i =0;i<sideCount;i++){
        x=cos(theta)*radius;
        y=sin(theta)*radius;
        vertex(x,y);
        theta += TWO_PI/sideCount;
        theta += TWO_PI/sideCount;
      }
      endShape(CLOSE);
    }
}