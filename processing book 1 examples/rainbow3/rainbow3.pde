// Multi Modes
size(720, 100);
noStroke();
// standard values
colorMode(HSB, 360, 100, 100);
for (int i=0; i<360; i++){
for (int j=0; j<100; j++){
fill(i, j, j);
rect(i, j, 1, 1);
}
}
// ridiculous, but possible
colorMode(HSB, 1.0, .01, 3000);
for (float i=0, ii=0; i<1.0; i+=1.0/360.0, ii++){
for (float j=0, jj=0, k=0; j<.01; j+=.01/100.0, 
jj++, k+=3000.0/100.0){
fill(i, j, k);
rect(360+ii, jj, 1, 1);
}
}
strokeWeight(2);
stroke(0);
noFill();
rect(0, 0, 360, 100);
rect(360, 0, 360, 100);