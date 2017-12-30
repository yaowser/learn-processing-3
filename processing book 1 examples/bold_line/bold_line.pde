size(200, 200);
background(255);
int margin = width/15;
strokeWeight(5);
for (int i=margin; i<width-margin; i++){
line(i, height/2, i, height/2); // both points are the same
}