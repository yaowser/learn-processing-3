size(300, 300);
background(0);
int cellWidth = width/20;
int cellHeight = height/30;
stroke(255);
//vertical lines
for (int i=cellWidth; i<width; i+=cellWidth){
for (int j=0; j<height; j++){
point(i, j);
}
}
//horizontal lines
for (int i=cellHeight; i<height; i+=cellHeight){
for (int j=0; j<width; j++){
point(j, i);
}
}