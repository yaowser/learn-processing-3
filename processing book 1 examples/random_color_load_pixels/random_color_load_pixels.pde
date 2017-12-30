// Color Banding with pixels[]
size(400, 400);
loadPixels();
int px = pixels.length;
int bands = 20; // should be a factor of px
color c;
for (int i=0; i<bands; i++){
c = color(random(255), random(255), random(255));
for (int j=(px/bands)*i; j<px/bands*(i+1); j++){
pixels[j] = c;
}
}
updatePixels();