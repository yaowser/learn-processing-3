/*
Nematode - stage 1
Ira Greenberg, January 7, 2006
stage 1
*/
size(500, 300);
background(255);
strokeWeight(.2);
smooth();
noFill();
float radius = 0;
float thickness = .35;
float x = 0;
float y = height/2;
float amp = .5;
float angle = 0;
for (int i=0; i<width; i++){
stroke(65, 10, 5);
translate(2, y);
ellipse(-radius/2, -radius/2, radius*.75, radius);
y = sin(radians(angle+=5))*amp;
radius+=thickness;
if (i==width/4){
thickness*=-1;
}
}