// ROY G BIV
size(400, 120);
noStroke();
colorMode(HSB);
float w = width/(255-42.5);
for (int i=0; i<width; i+=w){
fill(i, 255, 255);
rect(w*i, 0, w, height);
}