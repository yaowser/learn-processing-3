// Alpha
size(400, 315);
for (int i=0; i< height; i+=width/15){
float r=random(255);
float g=random(255);
float b=random(255);
for (int j=0, a=255; j<width; j+=width/10, a*=.8){
strokeWeight(5);
stroke(0, a);
fill(r, g, b, a);
rect(j, i, width/10, width/10);
}
}