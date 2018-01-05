//blendColor
size(400, 400);
smooth();
noStroke();
color c1 = color(255, 127, 0);
color c2 = color(0, 75, 150);
color[] blends = {
blendColor(c1, c2, ADD), /*tan*/
blendColor(c1, c2, SUBTRACT), /*red*/
blendColor(c1, c2, DARKEST), /*green*/
blendColor(c1, c2, LIGHTEST) /*pink*/
};
// background
fill(c1);
rect(0, 0, width, height);
for (int i=0; i<4; i++){
fill(blends[i]);
arc(width/2, height/2, width/1.25, height/1.25, 
PI/2*i, PI/2*i+PI/2);
}
// front circle
fill(c2);
arc(width/2, height/2, width/4, height/4, 0, TWO_PI);