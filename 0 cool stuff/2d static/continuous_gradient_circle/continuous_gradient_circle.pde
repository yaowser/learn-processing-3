//Continuous radial gradient
size(200,200);
background(0);
for (int i=255; i>0; i--){
noStroke();
fill(255-i);
ellipse(width/2, height/2, i, i);
}