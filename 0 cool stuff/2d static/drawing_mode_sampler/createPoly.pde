void createPoly(int sides, float radius, float startAng, int mode){
  float px, py;
  float theta = startAng;
  beginShape(mode);
  for (int i=0; i<sides; i++){
    px = cos(theta)*radius;
    py = sin(theta)*radius;
    vertex(px, py);
    theta += TWO_PI/sides;
    
  }
  endShape();
}
