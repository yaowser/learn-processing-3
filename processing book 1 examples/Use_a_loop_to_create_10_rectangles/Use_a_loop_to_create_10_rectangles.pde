// Use a loop to create 10 rectangles
size(200, 200);
int rects = 10;
int w = width/rects;
int h = w;
int x = 0;
int y = height/2-h/2;
int i = 0;
while (i++<rects){
rect(x, y, w, h);
x+=w;
}