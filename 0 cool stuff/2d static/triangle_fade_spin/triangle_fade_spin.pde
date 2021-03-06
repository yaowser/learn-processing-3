/*
 Nematode - stage 2
 Ira Greenberg, January 7, 2006
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
float angle2 = 0;
for (int i=0; i<width/2-15; i++){
  stroke(65, 10, 5);
  noFill();
  translate(2, y);
  if (i >= width/2-40) {
    fill(195, 110, 105, 70);
  } 
  else if (i >= width/4-40 && i <= width/2-100){
    fill(195, 110, 105, 8);
  } 
  else {
    fill(195, 110, 105, 2);
  }
  ellipse(-radius/2, -radius/2, radius*.75, radius);
  noStroke();
  fill(205, 110, 105, 40);
  ellipse(-radius/2, -radius/2, radius*.25, radius*.25);
  fill(205, 110, 105, 200);
  ellipse(-radius/2, -radius/2, radius*.05, radius*.05);
  y = sin(radians(angle+=5))*amp;
  radius+=thickness;
  radius+=sin(radians(angle2+=random(30)))*.4;
  if (i==width/4){
    thickness*=-.9;
  }
}