size(300, 300);
background(0);
int totalPts = 300;
float steps = totalPts+1;
stroke(255);
float rand = 0;
for (int i=1; i< steps; i++){
point((width/steps)*i, (height/2)+random(-rand, rand));
rand+=.2;
}