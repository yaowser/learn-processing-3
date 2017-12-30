/*
Yin Yang Fade
Ira Greenberg, November 20, 2005
*/
size(700, 200);
background(0);
// grid variables
float cellWidth = width*.01;
float cellHeight = height*.01;
int ptGap = 1;
int randHt = 0;
int randWdth = 0;
// find ratio of value range(255) to height and width
float valh = cellHeight*(255.0/height);
float valw = cellWidth*(255.0/width);
//grid overlay
//vertical lines
for (float i=cellWidth, v=255.0; i<width; i+=cellWidth + 
int(random(randWdth)), v-=valw ){
stroke(v);
for (int j=0; j<height; j+=ptGap){
  point(i, j);
}
}
//horizontal lines
for (float i=cellHeight, v=255.0; i<height; i+=cellHeight + 
int(random(randHt)), v-=valh ){
stroke(v);
for (int j=0; j<width; j+=ptGap){
point(j, i);
}
}
//razor tooth variables
float totalPts = 1000.0;
float steps = totalPts+1.0;
int totalRows = 50; // needs to be < = 300
int rowShift = height/totalRows;
float valr = 255.0/steps; // used for value shift
float rowNudge = -.7;
float rowHop = 0;
int randNudge = 8;
// razor tooth pattern
for (int i=rowShift; i<height; i+=rowShift ){
for (float j=1, v=255; j< steps; j++, v-=valr){
stroke(v);
rowHop-=rowNudge;
if (j % (1 + (int)(random(randNudge))) == 0){
rowNudge*=-1;
}
point(width/steps*j, i+rowHop);
}
}