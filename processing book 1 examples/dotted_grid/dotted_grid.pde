/*
Point Grid
Ira Greenberg, November 20, 2005
*/
size(300, 300);
background(0);
// grid variables
int cellWidth = width/20;
int cellHeight = height/20;
int ptGap = 3;
int randHt = 4;
int randWdth = 10;
stroke(255);
//vertical lines
for (int i=cellWidth; i<width; i+=cellWidth+int(random(randWdth))){
  for (int j=0; j<height; j+=ptGap){
point(i, j);
}
}
//horizontal lines
for (int i=cellHeight; i<height; i+=cellHeight+int(random(randHt)) ){
for (int j=0; j<width; j+=ptGap){
point(j, i);
}
}