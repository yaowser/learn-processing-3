PImage img01;
void setup(){

  img01 = loadImage("2017-12-21.jpg");
  float w=img01.width;
  float h=img01.height;
  size(int(w),int(h));
  background(img01);
  //image(img01,0,0);
}