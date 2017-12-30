//Compositing
size(650, 450);
PImage img = loadImage("2017-12-21.jpg");
image(img, 0, 0);
int w = width/5;
int h = height/5;
PImage[]frags = {
get(130, 140, w, h),
get(475, 220, w, h),
get(220, 300, w, h),
get(300, 205, w, h),
get(100, 250, w, h)
};
for (int i=0; i<5; i++){
image(frags[i], width-w, h*i);
}