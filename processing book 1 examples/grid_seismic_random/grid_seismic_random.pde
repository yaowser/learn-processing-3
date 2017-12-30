/*
Yin Yang
Ira Greenberg, November 20, 2005
*/
size(300, 300);
background(0);
//razor tooth variables
int totalPts = 1000;
float steps = totalPts+1;
int totalRows = 50; // needs to be < = 300
int rowShift = height/totalRows;
float rowNudge = -.8;
float rowHop = 0;
int randNudge = 8;
stroke(255);
// razor tooth pattern
for (int i=rowShift; i<height; i+=rowShift ){
for (int j=1; j< steps; j++){
rowHop-=rowNudge;
if (j % (1 + (int)(random(randNudge))) == 0){
rowNudge*=-1;
}
point(width/steps*j, i+rowHop);
}
}
// grid variables
int cellWidth = width/60;
int cellHeight = height/60;
int ptGap = 1;
int randHt = 5;
int randWdth = 5;
//grid overlay
//vertical lines
stroke(40);
for (int i=cellWidth; i<width; i+=cellWidth+int(random(randWdth))){
for (int j=0; j<height; j+=ptGap){
point(i, j);
}
}
//horizontal lines
stroke(10);
for (int i=cellHeight; i<height; i+=cellHeight+int(random(randHt)) ){
for (int j=0; j<width; j+=ptGap){
point(j, i);
}
}