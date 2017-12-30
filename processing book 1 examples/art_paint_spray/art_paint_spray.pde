/*
Fade-Spin
Ira Greenberg, January 7, 2006
*/
int w = 20, h = 20;
float ang = 0;
float amp = 60;
void setup(){
size(500, 300);
background(170, 120, 150);
noStroke();
smooth();
for (int i=0, x=0; i<width; i++, x++){
fill(200-255/width*i, 200-255/width*i, 165/width*i, 140);
resetMatrix();
translate(x, height/4);
rotate(radians(x*.45));
rect(-w, -h, w*.2, h*random(-.1, .4));
}
resetMatrix();
for (int i=0, x=0; i<width; i++, x++){
fill(255.0/width*i, 255.0-255.0/width*i, 127.0/width*i, 95);
pushMatrix();
translate(x, height-height/5);
rotate(radians(x*1.75));
rect(-w, -h, w, h);
popMatrix();
}
for (float i=0, x=0, y=0; i<width; i++, x++){
fill(160-50/width*i, 255.0/width*i, 200-190/width*i, 20);
pushMatrix();
translate(x, height/2+y);
rotate(radians(x*1.75));
rect(-w*.55, -h*.55, w*.55+y*.125, h*.55+y*.125);
popMatrix();
y = sin(radians(ang+=2))*amp+random(15);
}
for (float i=0, x=0, y=0; i<width; i++, x+=1.5, y++){
fill(50.0-255.0/width*i, 127.0-255.0/width*i, 200.0/width*i, 10);
pushMatrix();
translate(-50+x, y);
rotate(radians(x*1.75));
rect(-w*3.55, -h*3.55, w*3.55, h*3.55);
popMatrix();
}
}