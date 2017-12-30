/*
Table Layout II
Ira Greenberg, November 21, 2005
*/
void setup(){
size(700, 500);
background(0);
drawTable();
}
void drawTable(){
stroke(255);
int[]caps = { ROUND, PROJECT, SQUARE };
strokeWeight(.1);
int cols = 20;
int rows= 20;
int xPadding = 100;
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
line(x+random(-4, 4), y+random(-4, 4), x+w+random(-4, 4), 
y+random(-4, 4));
line(x+w+random(-4, 4), y+random(-4, 4), x+w+random(-4, 4), 
y+h+random(-4, 4));
line(x+random(-4, 4), y+h+random(-4, 4), x+w+random(-4, 4), 
y+h+random(-4, 4));
line(x+random(-4, 4), y+h+random(-4, 4), x+random(-4, 4), 
y+random(-4, 4));
x += w+colSpan;
}
y+=h+rowSpan;
}
}