import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class polygonsketch extends PApplet {

public void setup(){
  
  background(255,255,0);
  noFill();
  int polyCount=300;
  float maxSideCount = 100;
  for(int i=0;i<polyCount;i++){
    int sideCount = PApplet.parseInt(random(3, maxSideCount));
    float radius=random(25,width/2.5f);
    float rotation=random(TWO_PI);
    pushMatrix();
    strokeWeight(sideCount);
    stroke(sideCount*8,random(255),random(255),random(20,255));
    translate(width/2+random(-60,60),height/2+random(-60,60));
    rotate(rotation);
    if(i%3==0){
      new Polygon(sideCount,radius);
    }
    strokeWeight(random(.75f,20.5f));
    stroke(255,255,0);
    new Polygon(PApplet.parseInt(random(3,6)),radius*5);
    popMatrix();
  }
}
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
  public void settings() {  size(800,800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "polygonsketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
