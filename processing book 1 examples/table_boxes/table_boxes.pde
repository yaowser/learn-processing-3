/*
Table Layout I
Ira Greenberg, November 21, 2005
*/
size(500, 300);
background(255);
int[]caps = {ROUND, PROJECT, SQUARE};
strokeWeight(1);
int cols = 30;
int rows= 40;
int xPadding = 150;
int yPadding = 100;
float w = (width-xPadding)/cols;
float h = (height-yPadding)/rows;
float colSpan = (width-cols*w)/(cols+1);
float rowSpan = (height-rows*h)/(rows+1);
float x;
float y = rowSpan;
for (int i=0; i<rows; i++){
x = colSpan;
for (int j=0, k=0; j<cols; j++){
strokeCap(caps[k++]);
if (k>2){
k=0;
}
line(x, y, x+w, y);
line(x+w, y, x+w, y+h);
line(x, y+h, x+w, y+h);
line(x, y+h, x, y);
x += w+colSpan;
}
y+=h+rowSpan;
}