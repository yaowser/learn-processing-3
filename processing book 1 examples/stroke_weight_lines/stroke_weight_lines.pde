size(500, 300);
background(255);
int step = height/10;
for (int i=step; i< height; i+=step ){
strokeWeight(i*.1);
line(20, i, width-20, i);
}