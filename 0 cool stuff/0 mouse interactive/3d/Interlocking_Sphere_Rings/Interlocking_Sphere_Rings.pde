// Interlocking Sphere Rings
float radius = 120.0;
int segments = 30;
float sphereSize = 7.0;

void setup(){
  size(400, 400, P3D);
  noStroke();
  sphereDetail(8);
}

void draw(){
  background(0);
  lights();
  translate(width/2, height/2);
  rotateY(frameCount*PI/50);
  rotateX(frameCount*PI/46);
  float x, y, z;
  for(int i=0; i<3; i++){
    float ang = 0;
    for(int j=0; j<segments; j++){
      pushMatrix();
      if (i==0){
        x = cos(ang)*radius;
        y = sin(ang)*radius;
        z=0;
        fill(abs(y), abs(x), abs(y-x));
      } 
      else if (i==1){
        x = cos(ang)*radius;
        z = sin(ang)*radius;
        y=0;
        fill(abs(x-z), abs(z), abs(z));
      }  
      else{
        y = cos(ang)*radius;
        z = sin(ang)*radius;
        x=0;
        fill(abs(y-z), abs(z-y), abs(z+y));
      }
      translate(x, y, z);
      sphere(sphereSize);
      popMatrix();
      ang+=TWO_PI/segments;
    }
  }
}