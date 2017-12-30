/*
Diagonal Line I
Ira Greenberg, December 3, 2005
*/
size(200, 200);
background(255);
int margin = width/15;
strokeWeight(5);
smooth();
float x = margin, y = margin;
float deltaX = 1.2;
float deltaY = 1.2;
if (deltaX>deltaY){
while(x<width-margin){
point(x, y);
x += deltaX;
y += deltaY;
}
} else{
while(y<height-margin){
point(x, y);
x += deltaX;
y += deltaY;
}
}