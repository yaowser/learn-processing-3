// Tint()
size(600, 400);
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
int tintAlpha = 255;
int[][]cols = {
{255, 0, 0, tintAlpha}, {255, 255, 0, tintAlpha},
{0, 0, 255, tintAlpha}, {0, 255, 0, tintAlpha},
{255, 0, 255, tintAlpha}, {255, 127, 0, tintAlpha}
};
int columns = 3;
int w = width/columns;
int h = cols.length;
for (int i=0; i<h; i++){
tintAlpha = 255;
for (int j=0; j<w; j++){
tint(color(cols[i][0], cols[i][1], cols[i][2], tintAlpha));
image(img, j*w, i*height/h, w, height/h );
tintAlpha-=(255/columns);
}
}