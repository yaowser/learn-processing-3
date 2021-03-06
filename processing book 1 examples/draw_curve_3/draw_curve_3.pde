/* Second-degree polynomial
y = 2x2 -3x + 19;
curve fits within display window*/
size(200, 200);
background(255);
strokeWeight(3);
float x = 0, y = 0;
int loopLimit = 100;
/*Instead of using the magic number 19324.0 in the ratio, I used the
polynomial and plugged in the loop limit to get the maximum. This
way if the window size changes, the program should still work.*/
float ratio = height/(2*pow(loopLimit-1, 2)-3*loopLimit-1 + 19);
for (int i=0; i<loopLimit; i++){
x = i;
y = 2* pow(x, 2)-3*x + 19;
point(x, y*ratio);
}