size(300, 300);
background(0);
int cellWidth = width/30;
stroke(255);
//vertical lines
for (int i=cellWidth; i<width; i+=cellWidth){
for (int j=0; j<height; j++){
point(i, j);
}
}