/*
Table Explode
Ira Greenberg, November 21, 2005
*/
void setup(){
size(700, 500);
background(0);
int cols = 24;
int rows = 24;
color[]clrs = new color[cols*rows];
float[]strokeWts = new float[cols*rows];
int xPadding = -20;
int yPadding = -50;
float[]r1 = new float[16];
float[]r2 = new float[16];
float randomFactor = 6;
int colorMin = 0; // 0 = black
float strokeWtMax = 2;
int overDraw = 10;
for (int i=0; i<r1.length; i++){
r1[i] = random(-randomFactor);
r2[i] = random(randomFactor);
}
for (int i=0; i<clrs.length; i++){
clrs[i] = colorMin + int(random(255-colorMin));
strokeWts[i] = random(strokeWtMax);
}
// calls main drawing function
for (int i=0; i<overDraw; i++){
drawTable(r1, r2, clrs, cols, rows, strokeWts, 
xPadding, yPadding);
}
}
void drawTable(float[]r1, float[]r2, color[]clrs, int cols, 
int rows, float[]strokeWts, int xPadding, int yPadding){
int[]caps = {ROUND, PROJECT, SQUARE};
float w = (width-xPadding)/cols;
float h = (height-yPadding)/rows;
float colSpan = (width-cols*w)/(cols+1);
float rowSpan = (height-rows*h)/(rows+1);
float x;
float y = rowSpan;
int ttlCounter = 0;
for (int i=0; i<rows; i++){
x = colSpan;
for (int j=0, k=0; j<cols; j++){
strokeCap(caps[k++]);
if (k>2){
k=0;
}
// stroke colors
stroke(clrs[ttlCounter]);
// stroke weight
strokeWeight(strokeWts[ttlCounter++]);
line(x+random(r1[0], r2[0]), y+random(r1[1], r2[1]), 
x+w+random(r1[2], r2[2]), y+random(r2[3], r2[3]));
line(x+w+random(r1[4], r2[4]), y+random(r1[5], r2[5]), 
x+w+random(r1[6], r2[6]), y+h+random(r1[7], r2[7]));
line(x+random(r1[8], r2[8]), y+h+random(r1[9], r2[9]), 
x+w+random(r1[10], r2[10]), y+h+random(r1[11], r2[11]));
line(x+random(r1[12], r2[12]), y+h+random(r1[13], r2[13]), 
x+random(r1[14], r2[14]), y+random(r1[15], r2[15]));
x += w+colSpan;
}
y+=h+rowSpan;
}
}