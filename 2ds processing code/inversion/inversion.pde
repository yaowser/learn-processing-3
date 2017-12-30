void setup(){
  background(255);
 size(800,400);
 PImage p = loadImage("2017-12-21.jpg");
 int len = p.pixels.length -1;
 image(p,0,0);
 PImage p2 = createImage(512,384,RGB);
 for(int i=len;i>=0;i--){
   p2.pixels[len-i]=p.pixels[i];
 }
 image(p2,400,0);
}