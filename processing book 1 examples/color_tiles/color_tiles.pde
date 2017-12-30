// Color Modes RGB/HSB
size(400, 114);
smooth();
color red1 = color(255, 0, 0);
color orange1 = color(255, 127, 0);
color yellow1 = color(255, 255, 0);
color green1 = color(0, 255, 0);
color cyan1 = color(0, 255, 255);
color blue1 = color(0, 0, 255);
color purple1 = color(255, 0, 255);
colorMode(HSB);
color red2 = color(0, 255, 255);
color orange2 = color(21.25, 255, 255);
color yellow2 = color(42.5, 255, 255);
color green2 = color(85, 255, 255);
color cyan2 = color(127.5, 255, 255);
color blue2 = color(170.0, 255, 255);
color purple2 = color(212.5, 255, 255);
color[][]cols = { 
{ red1, orange1, yellow1, green1, cyan1, blue1, purple1 },
{ red2, orange2, yellow2, green2, cyan2, blue2, purple2 }
};
int w = width/cols[0].length;
int h = w;
for (int i=0; i<2; i++){
for (int j=0; j<cols[i].length; j++){
fill(cols[i][j]);
rect(w*j, h*i, w, h);
}
}