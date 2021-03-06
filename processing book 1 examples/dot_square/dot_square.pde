/*
Point Recorder/Plotter
Ira Greenberg, November 23, 2005
*/
void setup(){
size(300, 300);
background(0);
// create arrays to hold x, y coords
float[]x = new float[4];
float[]y = new float[4];
// create a convenient 2 dimensional
// array to hold x, y arrays
float[][]xy = {x, y};
//record points
//x positions
xy[0][0] = 50;
xy[0][1] = 250;
xy[0][2] = 250;
xy[0][3] = 50;
//y positions
xy[1][0] = 50;
xy[1][1] = 50;
xy[1][2] = 250;
xy[1][3] = 250;
// call plotting function
makeRect(xy);
}
void makeRect(float[][]pts){
stroke(255);
smooth();
for (int i=0; i<pts[0].length; i++){
//plots vertices
strokeWeight(5);
point(pts[0][i], pts[1][i]);
//plot connecting lines
strokeWeight(.5);
if (i>0){
line(pts[0][i], pts[1][i], pts[0][i-1], pts[1][i-1]);
}
if (i== pts[0].length-1){
line(pts[0][i], pts[1][i], pts[0][0], pts[1][0]);
}
}
}