/*
title: fun with variables
description: stepped radial gradient
created: August 7, 2005
by: Ira Greenberg
*/
// declare some global variables
int xpos;
int ypos;
int interval;
int gradientWidth, gradientHeight;
// set the sketch window size and background
size(200,200);
background(0);
// define variable values
// controls banding of gradient
interval = 255/5;
// radial width/height
gradientWidth = gradientHeight = width;
//radial center pt
xpos = width/2;
ypos = height/2;
//turn off stroke rendering
noStroke();
//create ellipses
//set fill color and render ellipse
fill(interval);
ellipse(xpos, ypos, gradientWidth, gradientHeight);
fill(interval*2);
ellipse(xpos, ypos, gradientWidth-interval, gradientHeight-interval);
fill(interval*3);
ellipse(xpos, ypos, gradientWidth-interval*2,gradientHeight-interval*2);
fill(interval*4);
ellipse(xpos, ypos, gradientWidth-interval*3,gradientHeight-interval*3);
fill(interval*5);
ellipse(xpos, ypos, gradientWidth-interval*4,gradientHeight-interval*4);