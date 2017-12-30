/*
Razor Tooth Pattern
Ira Greenberg, November 20, 2005
*/
size(300, 300);
background(0);
int totalPts = 1000;
float steps = totalPts+1;
int totalRows = 50; // needs to be < = 300
int rowShift = height/totalRows;
float rowNudge = -.4;
float rowHop = 0;
int randNudge = 5;
stroke(255);
for (int i=rowShift; i<height; i+=rowShift ){
for (int j=1; j<steps; j++){
rowHop-=rowNudge;
if (j % (1 + (int)(random(randNudge))) == 0){
rowNudge*=-1;
}
point((width/steps)*j, i+rowHop);
}
}