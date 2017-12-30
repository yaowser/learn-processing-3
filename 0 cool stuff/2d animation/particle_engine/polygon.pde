void polygon(float x, float y, float radius, int sides, float strokeWt, color strokeCol){
    float theta = 0;
    float rotAmount = TWO_PI/sides;
    strokeWeight(strokeWt);
    stroke(strokeCol);
    beginShape();
    float x2,y2;
    for(int j = 0; j < sides; j++){
      x2 = x + cos(theta)*radius*2;
      y2 = y + sin(theta)*radius*2;
      vertex(x2,y2);
      theta+=rotAmount;
    }
    endShape(CLOSE);
}