/**
 * requestImage() with preloader animation
 * Requires: 10 images named dublin0.jpg...
 * ALERT - Check "increase memory..." in preferences.
 * dublin9.jpg in the sketch data directory.
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

// ALERT - Check "increase memory..." in preferences.
int imgCount = 10;
PImage[] imgs = new PImage[imgCount];
float imgW;

// for loading animation
float loaderX, loaderY, theta;

void setup(){
  size(800, 60);
  smooth();
  imgW = width/imgCount;

  // load images asynchronously
  for (int i=0; i<imgCount; i++){
    imgs[i] = requestImage("dublin"+i+".jpg");
  }
}

void draw(){
  background(0);

  // when all images are loaded draw them to the screen
  if (checkLoadStates()){
    drawImages();
  } 
  else {
    // only run the preloader if images aren’t loaded
    runLoaderAni();
  }
}

void drawImages(){
  for (int i=0; i<imgs.length; i++){
    image(imgs[i], width/10*i, 0, imgW, height);
  }
}

// loading animation
void runLoaderAni(){
  // only run when images are loading
  if (!checkLoadStates()){
    ellipse(loaderX, loaderY, 10, 10);
    loaderX += 2;
    loaderY= height/2+sin(theta)*(height/2.5);
    theta += PI/22;
    // reposition ellipse if it goes off the screen
    if (loaderX>width+5){
      loaderX = -5;
    }
  }
}

/* return true when all images are loaded
 - no zero-width or failed images left in array */
boolean checkLoadStates(){
  for (int i=0; i<imgs.length; i++){
    if (imgs[i].width <= 0){
      return false;
    }
  }
  return true;
}



