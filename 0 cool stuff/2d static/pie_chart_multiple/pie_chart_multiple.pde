//Progressive Arcs
size(400, 400);
background(50);
smooth();
noStroke();
float diameter = 40;
float ang = 0;
float col = 0;
float xCount = width/diameter;
float yCount = height/diameter;
float cellTotal = xCount*yCount;
float angIncrement = radians(360.0/cellTotal);
float colIncrement = 255.0/cellTotal;
for (float i=diameter/2; i<=height; i+=diameter){
for (float j=diameter/2; j<=width; j+=diameter){
ang+=angIncrement;
col += colIncrement;
fill(col);
arc(j, i, diameter, diameter, 0, ang);
}
}