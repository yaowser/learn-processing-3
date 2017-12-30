PImage img;

void setup(){
 size(600,600);
 img = loadImage("2017-12-21.jpg");
 image(img,0,0);
 loadPixels();
 //for(int i=0;i<pixels.length;i++){
 //  float r = red(pixels[i]);
 //  float g = green(pixels[i]);
 //  float b = blue(pixels[i]);
 //  r *= 0.9;
 //  g *= 0.9;
 //  b *= 0.85;
 //  pixels[i]=color(r,g,b);
 //}
 for(int i=0;i<500;i++){
   pixels[int(random(pixels.length))]=color(0);
 }
 updatePixels();
 image(img,width/2,0);
}