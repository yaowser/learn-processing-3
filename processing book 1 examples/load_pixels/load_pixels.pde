size(100, 100);
background(0);
loadPixels();
pixels[height/2*width+width/2] = color(255);
updatePixels();