void setup(){
 size(600, 800);
 background(0);
 stroke(255,255,0);
 noFill();
 translate(width/2, height/2);
 
 
 //rect(-50,-50,100,100);
 pushMatrix();
 rotate(PI/360*50);
 rect(-50,-50,100,100);
 popMatrix();
 pushMatrix();
 rotate(PI/360*50);
 rect(-50,-50,100,100);
 pushMatrix();
}