/*
Orbiting Text
Ira Greenberg, November 14, 2005
*/
PFont font;
String s = "Spinning Word";
PFont font2;
String s2 = "flipping Word";
float ang = 0, ang2 =0;
void setup(){
size(400, 400, P3D);
//load text from data directory
//font = loadFont("Garamond-32.vlw");
//dynamically create text and specify size as the second argument
//font2 = createFont("Helvetica", 32);
}
//rotates text in 3D space
void draw(){
background(255);
translate(width/2, height/2, 50);
pushMatrix();
rotateY(radians(ang));
//textFont(font, 32);
fill(45, 78, 28);
text(s, -textWidth(s)/2, 0, 100);
popMatrix();
pushMatrix();
rotateX(radians(ang2));
//textFont(font2, 24);
fill(250, 125, 28);
text(s2, -textWidth(s2)/2, 0, 0);
popMatrix();
ang+=3;
ang2-=10;
}