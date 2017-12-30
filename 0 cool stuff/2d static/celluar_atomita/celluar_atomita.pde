int[][] states = {
  {0,0,0},
  {0,0,1},
  {0,1,0},
  {0,1,1},
  {1,0,0},
  {1,0,1},
  {1,1,0},
  {1,1,1}
};
int[] rules = {0,1,1,1,1,1,1,0};

void setup(){
  size(800,800);
  background(255);
  int[][] srcBits= new int[height][width];
  for(int i=0;i<height;i++){
    for(int j=0;j<width;j++){
      if (i == height - 1 && j == width/2){
        srcBits[i][j]=1;
      }else{
        srcBits[i][j]=0;
      }
    }
  }
  for(int i = srcBits.length-1;i>0;i--){
    for(int j=1;j<srcBits[i].length-1;j++){
      int bit = checkNeighborhood(srcBits[i][j-1],srcBits[i][j],srcBits[i][j+1]);
      srcBits[i-1][j] = bit;
    }
  }
  
  loadPixels();
  for(int i=0;i<height;i++){
    for(int j=0;j<width;j++){
      int k = i*width+j;
      if (srcBits[i][j]==1){
        pixels[k] = color(0);
      }
    }
  }
  updatePixels();
}