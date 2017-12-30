/*
title: Bouncing Ball
description: ball deflects off sketch window edges
created: August 9, 2005
by: Ira Greenberg
*/
// declare global variables
int xspeed, yspeed;
int xpos, ypos, wdth, ht;
//initialize sketch
void setup(){
//set sketch window size and background color
size(400, 400);
background(0);
//ball speed
xspeed = 3;
yspeed = 6;
//ball size
wdth = 10;
ht = 10;
// turn off shape stroke rendering
noStroke();
//initial ball placement
xpos = width/2;
ypos = height/2;
frameRate(30);
}
// begin animation loop
void draw(){
//update background
background(0);
//draw ball
ellipse(xpos, ypos, wdth, ht);
//upgrade position values
xpos+=xspeed;
ypos+=yspeed;
/*conditionals
detects ball collission with sketch window edges
also accounts for thickness of ball
*/
if (xpos>=width-wdth/2 || xpos<=wdth/2){
xspeed*=-1;
}
if (ypos>=height-ht/2 || ypos<=ht/2){
yspeed*=-1;
}
}