PImage img;

void setup(){
 size(600,600);
 img = loadImage("2017-12-21.jpg");
 image(img,0,0);
 loadPixels();
 for(int i=0;i<pixels.length;i++){
   float r = red(pixels[i]);
   float g = green(pixels[i]);
   float b = blue(pixels[i]);
   r = 255-r;
   g = 255-g;
   b = 255-b;
   pixels[i]=color(r,g,b);
 }
 updatePixels();
}