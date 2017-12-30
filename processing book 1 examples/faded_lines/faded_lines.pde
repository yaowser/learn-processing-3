size(300, 300);
background(0);
float cellWidth = width/30.0;
// find ratio of value range(255) to width
float val = cellWidth*(255.0/width);
//vertical lines
for (float i=cellWidth, v=255; i<width; i+=cellWidth, v-=val){
stroke(v);
for (int j=0; j<height; j++){
point(i, j);
}
}