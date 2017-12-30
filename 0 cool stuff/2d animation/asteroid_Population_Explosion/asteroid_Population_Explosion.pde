/* Population Explosion
Ira Greenberg, November 6, 2005
revised October 10, 2006 */
//declare some global variables
int botCount = 0;
int botLimit = 1000;
color worldColor = color(0, 40);
color[] botColor = new color[botCount];
float[] x = new float[botCount];
float[] y = new float[botCount];
float[] speedX = new float[botCount];
float[] speedY = new float[botCount];
float botSize = 3;
void setup(){
size(400, 400);
smooth();
noStroke();
breedBot();
}
void draw(){
fill(worldColor);
rect(0, 0, width, height);
birthBot();
moveBot();
detectCollision();
}
// expand arrays
void breedBot(){
if (botCount<1000){
botCount++;
// expand arrays
x = append(x, width/2);
y = append(y, height/2);
speedX = append(speedX, random(-3, 3));
speedY = append(speedY, random(-3, 3));
botColor = append(botColor, color(random(200, 255), 
random(127), random(40), random(100, 255)));
}
}
// draw bots
void birthBot(){
for (int i=0; i<botCount; i++){
fill(botColor[i]);
ellipse(x[i], y[i], botSize, botSize);
}
}
// animate bots
void moveBot(){
for (int i=0; i<botCount; i++){
x[i]+=speedX[i];
y[i]+=speedY[i];
}
}
// check boundary collisions
void detectCollision(){
for (int i=0; i<botCount; i++){
// right and left boundaries
if (x[i] >= width-botSize/2 || x[i] <= botSize/2){
// reverse direction
speedX[i]*=-1;
// make new bot
breedBot();
}
// top and bottom boundaries
if (y[i] >= height-botSize/2 || y[i] <= botSize/2){
// reverse direction
speedY[i]*=-1;
// make new bot
breedBot();
}
}
}