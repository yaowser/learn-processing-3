float v = 1.0 / 9.0;
float[][] kernel = {{ v, v, v }, 
                    { v, v, v }, 
                    { v, v, v }};
                    
PImage img;

void setup() {
  size(640, 360);
  img = loadImage("2017-12-21.jpg");
  noLoop();
} 

void draw() {
  image(img, 0, 0);
  img.loadPixels();

  PImage edgeImg = createImage(img.width, img.height, RGB);

  for (int y = 1; y < img.height-1; y++) {   
    for (int x = 1; x < img.width-1; x++) { 
      float sum = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {

          int pos = (y + ky)*img.width + (x + kx);

          float val = red(img.pixels[pos]);

          sum += kernel[ky+1][kx+1] * val;
        }
      }

      edgeImg.pixels[y*img.width + x] = color(sum);
    }
  }

  edgeImg.updatePixels();

  image(edgeImg, width/2, 0);
}