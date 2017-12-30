void polygon(float radius, int sides, float strokeWt, color strokeCol){
  float theta = 0;
  float rotAmount = TWO_PI/sides;
  strokeWeight(strokeWt);
  stroke(strokeCol);
  beginShape();
  for(int i = 0; i < sides; i++){
    float x2 = x + cos(theta)*radius*2;
    float y2 = y + sin(theta)*radius*2;
    vertex(x2,y2);
    theta+=rotAmount;
  }
  endShape(CLOSE);
  
}