/** 
* Fast color transform
* using bitwise color operations 
*/
size(275, 150);
color col1 = color(200, 100, 40);
fill(col1);
noStroke();
rect(25, 25, 100, 100);
// get component values
int a = col1 >> 24 & 0xFF;
int r = col1 >> 16 & 0xFF;  
int g = col1 >> 8 & 0xFF;
int b = col1 & 0xFF; 
// transform individual components
r-=150;
g+=50;
b+=100;
// put color back together
col1 = (a << 24) | (r << 16) | (g << 8) | b;
fill(col1);
rect(150, 25, 100, 100);


