// Acceleration Calculations
float x = 0, x2 = 0, y = 0, y2 = 0;
float xSpeed = 3.0, ySpeed = .0;
float gravity = .5;
void setup(){
for (int i=0; i<5; i++){
ySpeed += gravity;
y += ySpeed;
println("y = " + y + " increase = " + (y-y2));
y2 = y;
}
println("");
for (int i=0; i<5; i++){
  x+=xSpeed;
println("x = " + x + " increase = " + (x-x2));
x2 = x;
}
}