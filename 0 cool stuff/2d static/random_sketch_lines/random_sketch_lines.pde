// elegant vertex() approach
size(300, 300);
background(255);
strokeWeight(3);
noFill();
smooth();
beginShape();
for (int i=0; i<100; i++){
vertex(random(width), random(height));
}
endShape();
// kludgy line() approach
size(300, 300);
background(255);
strokeWeight(3);
smooth();
float x = random(width);
float y = random(height);
for (int i=0; i<100; i++){
float x2 = random(width);
float y2 = random(height);
line(x, y, x2, y2);
x = x2;
y = y2;
}