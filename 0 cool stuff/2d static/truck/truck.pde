//Toy Truck
int truckW = 300;
int truckH = 100;
int truckX = -truckW/2;
int truckY = -truckH/2;
void setup(){
size(500, 200);
background(0);
smooth();
//body1
translate(width-truckW/2-50, height/2);
rect(truckX, truckY, truckW, truckH);
//body2
translate(-width+316, 17);
scale(.2, .65);
rect(truckX, truckY, truckW, truckH);
//body3
translate(-width+250, 20);
scale(.7, .59);
noStroke();
rect(truckX, truckY, truckW, truckH);
//tires
stroke(255);
strokeWeight(7);
scale(.70, .75);
translate(160, 172);
ellipse(truckX, truckY, truckW, truckH);
translate(1300, 0);
ellipse(truckX, truckY, truckW, truckH);
translate(1800, 0);
ellipse(truckX, truckY, truckW, truckH);
translate(400, 0);
ellipse(truckX, truckY, truckW, truckH);
//window mask
translate(-3355, -284);
scale(.7, .9);
noStroke();
fill(0);
triangle(truckX, truckY + truckH, truckX+truckW, 
truckY, truckX, truckY);
}