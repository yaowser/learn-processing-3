size(500, 300);
background(255);
// used by diagonal lines
float slope = float(height)/float(width);
PImage img = createImage(width, height, RGB);
color c = color(0, 0, 0);
//horizontal line
for (int i=0; i<width; i++){
img.set(i, height/2, c);
}
//vertical line
for (int i=0; i<height; i++){
img.set(width/2, i, c);
}
//diagonal line (TL-BR)
for (float i=0; i<width; i++){
img.set(int(i), int(i*slope), c);
}
//diagonal line (BL-TR)
for (float i=0; i<width; i++){
img.set(int(i), int(height-i*slope), c);
}
image(img, 0, 0);