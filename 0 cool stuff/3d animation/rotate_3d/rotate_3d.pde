void setup(){
  size(800,800,P3D);
  fill(50,25,0);
  noStroke();
}

void draw(){
  background(127);
 // lights();
  translate(width/2,height/2);
  rotateY(radians(frameCount));
  rotateX(radians(frameCount)*.5);
lightSpecular(255, 255, 255);
directionalLight(204, 204, 204, 0, 1, -1);
specular(255, 255, 255);

  box(100);
  
  
  
}