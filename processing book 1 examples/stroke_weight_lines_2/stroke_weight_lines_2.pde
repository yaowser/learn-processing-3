size(500, 300);
background(255);
int step = height/10;
int[]caps = {ROUND, PROJECT, SQUARE};
int j = 0;
for (int i=step; i<height; i+=step ){
strokeWeight(i*.1);
strokeCap(caps[j++]);
if (j>2){
j=0;
}
line(20, i, width-20, i);
}