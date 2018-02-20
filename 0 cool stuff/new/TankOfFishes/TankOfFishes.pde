//some useful constants (initialized in the setup)
int TANK_LEFT;
int TANK_RIGHT;
int TANK_TOP;
int TANK_BOTTOM;
int WATER_TOP;
 
Fish[] fishes; // For global variables, explicit longer names are better
 
class Fish { // Be consistent in your naming conventions!
  int x, y, w, h, dir, r, g, b;
  float speed, boost;
  Bubble[] bub = new Bubble[5];
 
  Fish(int p1, int p2, int p3, int p4, int p5, int p6, int p7, int p8, float p9 ) {
 
    x = p1;
    y = p2;
    w = p3;
    h = p4;
    dir = p5;
    r = p6;
    b = p8;
    speed = p9;
    boost = 0; //initially zero
    for (int i = 0; i < bub.length; i++) {
      // posX and posY are relative to the fish's x and y
      int posX = 0; // or int(random(-3, 3)); // Put a little randomness in the bubble positions
      int posY = -2 - 5*i; // or -2 - int(5 * i * random(1, 2));
      // this is a reference to the current fish
      bub[i] = new Bubble(this, posX, posY, 5, 5);
    }
  }
}
 
class Bubble {
  Fish f; // The fish producing the bubbles
  int x, y, w, h;
  int disp; // displacement
 
  Bubble(Fish bf, int b1, int b2, int b3, int b4) {
    f = bf;
    x = b1;
    y = b2;
    w = b3;
    h = b4;
  }
 
  void draw() {
    fill(0, 200, 220, 120); // Green-blue with transparency
    int posX;
    if (isFacingRight(f)) {
      posX = f.x + f.w/2 + 5;
    } 
    else {
      posX = f.x - f.w/2 - 5;
    }
 
    ellipse(posX + x, f.y + y + disp, w, h);
    disp -= 1;
    if (disp < -25) {
      disp = 0; // Like a new bubble
      // For a more realistic effect, shift the bubble positions in the array...
    }
  }
}
 
 
void setup() {
  size(800, 600); //feel free to change this, all the code will change relative to it
//  frameRate(200);
  setConstants(); //initialize the tank size
  fishes = new Fish[10];
  for (int i = 0; i < fishes.length; i++) {
    fishes[i] = makeFish();
  }
}
 
 
/*The setConstants() method sets the size of the tank
 relative to the size of the canvas. If the canvas is
 too small the program exits with a warning message*/
void setConstants() {
  if (height < 250 || width < 200) {
    println("Sorry, needs a bigger canvas");
    exit();
  }
  TANK_LEFT = int(width*.15);
  TANK_RIGHT = width-int(width*.15);
  TANK_BOTTOM = height-100;
  TANK_TOP = height - TANK_BOTTOM;
  WATER_TOP = TANK_TOP + int((TANK_BOTTOM-TANK_TOP)*.2);
}
 
/*The draw method is the simulation loop of our program. It
 simply moves the fish, and then redraws the scene*/
void draw() {
  drawBackground();
  for (int i = 0; i < fishes.length; i++) {
    moveFish(fishes[i]);
    drawFish(fishes[i]);
  }
  drawForeground();
}
 
/*mousePressed() is an event handler called by Processing whenever
 the user clicks the mouse. If the location of the mouse is within
 the bounds of the aquarium's front face, a simulation of tapping
 the glass takes place. A circle is drawn around the mouse, and
 the fish speed away from the mouse*/
void mousePressed() {
  if (mouseX < TANK_RIGHT && mouseX > TANK_LEFT &&
    mouseY > WATER_TOP && mouseY < TANK_BOTTOM) {
    noFill();
    stroke(255);
    ellipse(mouseX, mouseY, 25, 25);
 
    for (Fish fish : fishes)
      scareFish(fish);
  }
}
 
/*scareFish is a wrapper method to clean the repitition of
 code five times with different fish variables.
 It turns the given fish away from the mouse, and gives it
 a boost to it's speed.
 Parameters:
 Fish f - the fish to scare*/
void scareFish(Fish f) {
  float tapDir = atan2(mouseY-f.y, mouseX-f.x);
  f.dir = (int)(degrees(tapDir) + 180) % 360;
  f.boost = f.speed;
}
 
 
 
/*The makeFish() method generates some random values, and then
 creates a fish object based on those values. 
 Returns:
 Fish - A fish object with randomized parameters*/
Fish makeFish() {
  //generate random values
  int randw = (int) random (20, 50);
  int randh = (int)random(randw-20, randw);
  int randD = (int)(random(360)); 
  int randx = (int)random(TANK_LEFT+randw, TANK_RIGHT-randw);

  int randy = (int)random(WATER_TOP, TANK_BOTTOM-(randh/2));
  int randr = (int)random(0, 256);
  int randg = (int)random(0, 256);
  int randb = (int)random(0, 256);
 
  float randSpeed = random(3) + 3;
  //call the constructor, and return the Fish object it returns  
  return new Fish(randx, randy, randw, randh, randD, randr, randg, randb, randSpeed);
}
 
boolean isFacingRight(Fish f) {
  int adir = abs(f.dir);
  return adir <= 90 || adir >= 270;
}
 
void moveFish(Fish f) {
 
  f.x = f.x + (int)((f.speed+f.boost)*cos(radians(f.dir)));
  f.y = f.y + (int)((f.speed+f.boost)*sin(radians(f.dir)));
  f.boost = f.boost*0.96;
 
  if (f.x-(f.w/2) <= TANK_LEFT) {
    f.dir = (180-f.dir) % 360;
    f.x = TANK_LEFT+f.w;
  }
  if (f.x+(f.w/2) >= TANK_RIGHT) {
    f.dir = (180-f.dir) % 360;  
    f.x = TANK_RIGHT - f.w;
  }
  if (f.y <= WATER_TOP) {
    f.dir = -f.dir;
    f.y=WATER_TOP;
  }
  if (f.y+(f.h/2) >= TANK_BOTTOM) {
    f.dir = -f.dir;
    f.y=TANK_BOTTOM - f.h/2;
  }
}
 
 
void drawFish(Fish f) {
  stroke(0);
  fill(f.r, f.g, f.b);
  ellipse(f.x, f.y, f.w, f.h);
 
  int tail;
  if (isFacingRight(f)) { //right
    tail = -(f.w/2);
 
    fill(255);
    ellipse(f.x+(f.w*0.25), f.y-(f.h*0.25), 10, 10);
    fill(0);
    ellipse(f.x+(f.w*0.25), f.y-(f.h*0.25), 5, 5);
  }
  else {
    tail = (f.w/2);
    fill(255);
    ellipse(f.x-(f.w*0.25), f.y-(f.h*0.25), 10, 10);
    fill(0);
    ellipse(f.x-(f.w*0.25), f.y-(f.h*0.25), 5, 5);
  }
  fill(f.r, f.g, f.b);
  triangle(f.x+tail, f.y, (f.x+(2*tail)), (f.y+(f.h/2)), (f.x+(2*tail)), (f.y-(f.h/2)));
 
  for (Bubble bubble : f.bub) {
    bubble.draw();
  }
}



/*drawBackground() organizes any background drawing that must
 be done*/
void drawBackground() {
  //wall
  background(128, 50, 50);
  //floor
  stroke(0);
  fill(100, 56, 0);
  rect(0, int(height*.7), width, int(height*.3));

  drawTable();
  drawAquariumBack();
}

/*The drawTable method draws a 3d table beneath where the
 fish tank will go*/
void drawTable() {
  //table legs
  stroke(0);
  fill(160, 116, 60); //shade
  //back left leg
  rect(TANK_LEFT, TANK_BOTTOM+50, 25, 15);
  triangle(TANK_LEFT+25, TANK_BOTTOM+50, TANK_LEFT+35, TANK_BOTTOM+50, TANK_LEFT+25, TANK_BOTTOM+65);
  //back right leg
  rect(TANK_RIGHT+40, TANK_BOTTOM-50, 25, 115);
  fill(200, 156, 100);  //unshaded
  quad(TANK_RIGHT+65, TANK_BOTTOM+65, TANK_RIGHT+75, TANK_BOTTOM+40, TANK_RIGHT+75, TANK_BOTTOM-100, TANK_RIGHT+65, TANK_BOTTOM-100);
  //front left leg
  rect(TANK_LEFT-50, TANK_BOTTOM+50, 25, 50);
  fill(160, 116, 60);
  quad(TANK_LEFT-25, TANK_BOTTOM+50, TANK_LEFT-15, TANK_BOTTOM+50, TANK_LEFT-15, TANK_BOTTOM+100, TANK_LEFT-25, TANK_BOTTOM+100);
  //front right leg
  fill(200, 156, 100);
  rect(TANK_RIGHT, TANK_BOTTOM+50, 25, 50);
  quad(TANK_RIGHT+25, TANK_BOTTOM, TANK_RIGHT+35, TANK_BOTTOM, TANK_RIGHT+35, TANK_BOTTOM+100, TANK_RIGHT+25, TANK_BOTTOM+100);

  //table top
  quad(TANK_LEFT-50, TANK_BOTTOM+25, TANK_LEFT+30, TANK_BOTTOM-100, TANK_RIGHT+75, TANK_BOTTOM-100, TANK_RIGHT+25, TANK_BOTTOM+25); //top
  rect(TANK_LEFT-50, TANK_BOTTOM+25, (TANK_RIGHT+25)-(TANK_LEFT-50), 25); //front
  quad(TANK_RIGHT+25, TANK_BOTTOM+25, TANK_RIGHT+75, TANK_BOTTOM-100, TANK_RIGHT+75, TANK_BOTTOM-75, TANK_RIGHT+25, TANK_BOTTOM+50); //side
}

/*drawAquariumBack draws the bottom, back, and left panes of
 the fish tank.*/
void drawAquariumBack() {
  //aquarium
  stroke(255);
  fill(255, 255, 255, 20); //faint white tint
  rect(TANK_LEFT+40, TANK_TOP-60, (TANK_RIGHT+25)-(TANK_LEFT+40), (TANK_BOTTOM-60)-(TANK_TOP-60));  //back
  quad(TANK_LEFT, TANK_BOTTOM, TANK_LEFT+40, TANK_BOTTOM-60, TANK_RIGHT+25, TANK_BOTTOM-60, TANK_RIGHT, TANK_BOTTOM); //bottom
  quad(TANK_LEFT, TANK_BOTTOM, TANK_LEFT+40, TANK_BOTTOM-60, TANK_LEFT+40, TANK_TOP-60, TANK_LEFT, TANK_TOP);//back-left
}

/*drawForeground organizes all the items that need to be drawn
 after the fish*/
void drawForeground() {
  drawWater();
  drawAquariumFront();
}

/*drawWater draws 3 panes of water on top of the fish to imitate
 a rectangular prism. Water is tinted translucent blue.*/
void drawWater() {
  noStroke();
  fill(50, 100, 255, 100); //translucent blue
  rect(TANK_LEFT, WATER_TOP, TANK_RIGHT-TANK_LEFT, TANK_BOTTOM-WATER_TOP); //front face
  quad(TANK_RIGHT, WATER_TOP, TANK_RIGHT+25, WATER_TOP-60, TANK_RIGHT+25, TANK_BOTTOM-60, TANK_RIGHT, TANK_BOTTOM); //right face
  stroke(0, 0, 56); //dark blue surface line
  quad(TANK_LEFT, WATER_TOP, TANK_LEFT+40, WATER_TOP-60, TANK_RIGHT+25, WATER_TOP-60, TANK_RIGHT, WATER_TOP);//top face
}

/*drawAquariumFront() draws the front and right panes of the aquarium*/
void drawAquariumFront() {
  //aquarium
  stroke(255);
  fill(255, 255, 255, 20);
  rect(TANK_LEFT, TANK_TOP, TANK_RIGHT-TANK_LEFT, TANK_BOTTOM - TANK_TOP);  //front
  quad(TANK_RIGHT, TANK_TOP, TANK_RIGHT+25, TANK_TOP-60, TANK_RIGHT+25, TANK_BOTTOM-60, TANK_RIGHT, TANK_BOTTOM);//front-right
  noFill();
  quad(TANK_LEFT, TANK_TOP, TANK_LEFT+40, TANK_TOP-60, TANK_RIGHT+25, TANK_TOP - 60, TANK_RIGHT, TANK_TOP); //top
}

