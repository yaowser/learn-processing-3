// Second-degree polynomial
// y = 2x2 -3x + 19;
size(200, 200);
background(255);
strokeWeight(3);
float x = 0, y = 0;
for (int i=0; i<100; i++){
x = i;
y = 2* pow(x, 2)-3*x + 19;
point(x, y);
}