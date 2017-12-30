/* blendColor and lerpColor
Ira Greenberg, October 12, 2006 */
size(210, 490);
background(100);
noStroke();
smooth();
color c1 = color(200, 10, 200);
color c2 = color(200, 200, 10);
//blend
color c_add = blendColor(c1, c2, ADD);
color c_subtract = blendColor(c1, c2, SUBTRACT);
color c_darkest = blendColor(c1, c2, DARKEST);
color c_lightest = blendColor(c1, c2, LIGHTEST);
//lerp
color c_lerp_25 = lerpColor(c1, c2, .25);
color c_lerp_5 = lerpColor(c1, c2, .5);
color c_lerp_75 = lerpColor(c1, c2, .75);
color[] cols = {
c_add, c_subtract, c_darkest,
c_lightest, c_lerp_25, c_lerp_5, c_lerp_75
};
for (int i=0; i<cols.length; i++){
fill(c1);
ellipse(35, 35+70*i, 70, 70);
fill(cols[i]);
ellipse(105, 35+70*i, 70, 70);
fill(c2);
ellipse(175, 35+70*i, 70, 70);
}