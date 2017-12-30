/*
algorithmic tree sketch
Ira greenberg, August, 2005
*/
/* import Handy Java class with
public x and y float props */
import java.awt.geom.Point2D;
// declare/define global variables
int counter;
int counter2;
float xg = 58;
float yg = 46;
int trunkSegments = int(random(7))+5;
int nodeLimit = 20000;
Point2D.Float[]pts = new Point2D.Float[nodeLimit];
int branchLimit = 620;
float trunkLength = int(random(50))+130;
float[]lean2 = new float[trunkSegments+1];
float radius = 26;
// initialize sketch
void setup(){
size(900, 600);
background(255);
stroke(30, 10, 5);
// create tree turnk
trunk();
}
void trunk(){
//draw trunk
for (int i=0; i<trunkSegments; i++){
float lean = myRand(22);
strokeWeight(radius+12);
line(width/2+lean2[i], height-(trunkLength/trunkSegments)*i, width/2+lean, height-(trunkLength/trunkSegments)*(i+1));
lean2[i+1] = lean;
}
// set inital branch point from top of trunk
pts[0] = new Point2D.Float(width/2+lean2[trunkSegments], height-trunkLength);
//create branches
branch(pts);
}
//main function that draws branches and leaves
void branch(Point2D.Float[]pts){
int stemCount=2;
// global variable branchLimit controls complexity of tree
if (counter2<branchLimit){
//set branch thickness
strokeWeight(radius);
// some conditionals change branches as
// they get further away from the trunk
if(counter2<200){
yg-=random(.354);
xg-=random(.625);
if (radius>2) {
radius*=.931;
}
} else if(counter2>=200){
// at top of tree branches get thinner and more numerous
stemCount = 2+(int)(Math.random()*15);
// leave color
stroke(random(60), 50+random(90), random(20), 230);
yg-=myRand(.65);
xg+=random(1.5);
radius*=(.91);
}
for (int j=0; j<stemCount; j++){
// randomize branch positions
float xx= myRand(30);
float yy= myRand(40);
/* commented out line below generates straight branches
line(pts[counter2].x, pts[counter2].y, pts[counter2].x+xg+xx,pts[counter2].y-yg+yy);
*/
// generates organic looking branches
orgLine(pts[counter2].x, pts[counter2].y, pts[counter2].x+xg+xx, pts[counter2].y-yg+yy);
/* fill up pts array to be passed back
recursively to branch function */
pts[counter+1] = new Point2D.Float(pts[counter2].x+xg+xx, pts[counter2].y-yg+yy);
// alternate branches left and right
xg*=-1;
// keep track of nodes
counter++;
}
// keeps track of branches
counter2++;
//recursive call
branch(pts);
}
}
// generates organic-looking branches
void orgLine (float x1, float y1, float x2, float y2){
int sections = 8;
float xd = x2-x1;
float yd = y2-y1;
float twist;
float[]twist2 = new float[sections+1];
for (int i =0; i<sections; i++){
twist = myRand(5);
line(x1+xd/sections*i+twist2[i], y1+yd/sections*i, x1+xd/sections*(i+1)+twist, y1+yd/sections*(i+1));
twist2[i+1] = twist;
}
}
//generate a random val between (-n, n)
float myRand(float val){
return random(val)+random(-val);
}