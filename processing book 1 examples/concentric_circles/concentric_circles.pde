//concentric circles
size(200, 200);
background(255);
int x = width/2, y = height/2;
int w = 100, h = 100;
strokeWeight(4);
smooth();
fill(0);
arc(x, y, w-50, h-50, 0, PI*2);
noFill();
arc(x, y, w, h, 0, TWO_PI);