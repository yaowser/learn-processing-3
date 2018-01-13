/**
 * Mouse events
 * IGButton class
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

class IGButton {

  // instance properties
  PImage img; // for gradient
  RoundedRect rr; //for mask
  // with some default values
  String label;
  int x, y, initX, initY;
  int w = 150, h = 60, initW, initH;
  color c = 0xff551122, initC;
  color hoverC;
  int border = 1;
  float cornerRadius = 15.0;
  int cornerDetail;
  // for label
  PFont font;

  // for jitter effect
  boolean isJittery = false;
  float jitterTheta = 0.0;
  float jitterDist = 25.0;
  float jitterRate = PI/15.0;

  // defuult constructor
  IGButton(){
    init();
  }

  IGButton(String label){
    this.label = label;
    init();
  }

  // constructor
  IGButton(String label, int x, int y, int w, int h, color c){
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    init();
  }

  // constructor
  IGButton(String label, int x, int y, int w, int h, color c, float cornerRadius){
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.cornerRadius = cornerRadius;
    init();
  }

  // constructor
  IGButton(String label, int x, int y, int w, int h, color c, int border, float cornerRadius){
    this.label = label;
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
    this.border = border;
    this.cornerRadius = cornerRadius;
    init();
  }

  void init(){
    img = createImage(w, h, RGB);
    cornerDetail = int(max(5, h*.2));
    // capture original values
    initX = x;
    initY = y;
    initW = w;
    initH = h;

    // color stuff
    initC = c;
    float btnR = red(c)*2;
    float btnG = green(c)*2;
    float btnB = blue(c)*2;
    hoverC = color(btnR, btnG, btnB);

    // label font
    font = loadFont("Helvetica-48.vlw"); 
    // for mask
    rr = new RoundedRect(x, y, w, h, cornerRadius, cornerDetail, border);
  }

  // reinitialize button
  void reInit(){
    img = createImage(w, h, RGB);
    // ensure corner detail at least 5
    cornerDetail = int(max(5, h*.2));
    // for mask
    rr = new RoundedRect(x, y, w, h, cornerRadius, cornerDetail, border);
  }

  // create gradient
  void create(){
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    float deltaR = (255-r);
    float deltaG = (255-g);
    float deltaB = (255-b);
    float delta = (deltaR+deltaG+deltaB)/3;
    float theta = 0.0;
    float colRatio = 180.0/img.height;
    for (int i=0; i<img.height; i++){
      float tempR = r + sin(radians(theta))*delta;
      float tempG = g + sin(radians(theta))*delta;
      float tempB = b + sin(radians(theta))*delta;
      for (int j=0; j<img.width; j++){
        img.pixels[img.width*i+j] = color(tempR, tempG, tempB);
      }
      theta += colRatio;
    }
    PImage p = rr.getPImage();
    img.mask(p);
    image(img, x, y);
    // button outline
    noFill();
    if (border==0){
      noStroke();
    } 
    else {
      strokeWeight(border+2);
      stroke(c);
    }

    rr.create();
    // label
    createLabel();
    // initialize jitter effect
    jitter();
  }

  void createLabel(){
    // fill col could be parameterized
    fill(10);
    // text sized based on button size
    textFont(font, w*.15+cornerDetail*.6);
    textAlign(CENTER);
    float ascent = textAscent();
    text(label, x, y + h/2-ascent/2, w, h);
  }

  /* detect mouse over button
   returns true or false */
  boolean isOver(float mx, float my){
    return (mx > x && mx < x+w && my > y && my < y+h);
  }

  // put stuff back the way it started
  void reset(){
    x = initX;
    y = initY;
    w = initW;
    h = initH;
    reInit();
  }

  // starts jitter
  void setJitter(){
    isJittery = true;
  }

  // overloaded method with some params
  void setJitter(float jitterDist, float jitterRate){
    isJittery = true;
    this.jitterDist = jitterDist;
    this.jitterRate = jitterRate;
  }

  // do the actual jitter
  void jitter(){
    if (isJittery){
      // slows jitte–could be parameterized
      float damping = .975;
      x = int(initX+cos(jitterTheta)*jitterDist);
      y = int(initY+sin(jitterTheta)*jitterDist);
      w = int(initW+sin(jitterTheta*1.5)*jitterDist);
      h = int(initH+cos(jitterTheta*1.5)*jitterDist);
      jitterTheta+=jitterRate;
      jitterDist*=damping;
      // keep from running continuously
      if (jitterDist<.03){
        isJittery = false;
        jitterTheta = 0;
      }
      reInit();
    }
  }

  void changeSize(int deltaW, int deltaH){
    x -=deltaW/2;
    y -=deltaH/2;
    w += deltaW;
    h += deltaH;
    reInit();
  }

  void setLoc(int mx, int my){
    x = mx;
    y = my;
    reInit();
  }

  void setLabel(String label){
    this.label = label;
  }

  void setColor(color c){
    this.c = c;
  }
}










