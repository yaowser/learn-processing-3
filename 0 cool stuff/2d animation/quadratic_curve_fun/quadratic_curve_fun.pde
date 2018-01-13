/**
 * Quadratic curve fun 
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

float x, y;
float pulse, pulseTheta, pulseAmp = 80, pulseFreq = PI/180;
float flow, flowTheta, flowBoost = 50, flowAmp = 60, flowFreq = PI/240;

void setup(){
  size(400, 400);
  smooth();
  noFill();
  strokeWeight(4);
  
}
void draw(){
  background(255);
  translate(width/2, height/4);
  beginShape();
  for (int i=-100; i<100; i++){
    y = 2*(i*i) + pulse*i - flow*flowBoost;
    vertex(i, y*.01);

  }
  pulse = sin(pulseTheta)*pulseAmp;
  flow = cos(flowTheta)*flowAmp;
  pulseTheta+=pulseFreq*2;
  flowTheta+=flowFreq*2;
  endShape();
}




