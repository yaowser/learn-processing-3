// ROY G BIV
// math-lite version
size(400, 120);
noStroke();
colorMode(HSB, width);
for (int i=0; i<width; i++){
fill(i, width, width);
rect(i, 0, i, height);
}