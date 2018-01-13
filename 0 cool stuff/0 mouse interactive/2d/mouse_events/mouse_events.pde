/**
 * Mouse events
 * Requires: IGButton, RoundedRect classes
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

// declare custom buttons
int btnCount = 4;
IGButton[] btns = new IGButton[btnCount];

void setup(){
  size(400, 375);
  noStroke();
  smooth();
  int w = 150, h = 65, x=int(width*.25-w/2), y=int(height*.25-h/2);
  btns[0] = new IGButton("Press", x, y, w, h, color(50, 50, 85), 0, 2);
  w = 100; 
  h = 100; 
  x=int(width*.75-w/2); 
  y=int(height*.25-h/2);
  btns[1] = new IGButton("Click", x, y, w, h, color(50, 90, 25), 1, 50);
  w = 100; 
  h = 100; 
  x=int(width*.25-w/2); 
  y=int(height*.75-h/2);
  btns[2] = new IGButton("Move", x, y, w, h, color(60, 20, 60), 3, 12);
  w = 150; 
  h = 65; 
  x=int(width*.75-w/2); 
  y=int(height*.75-h/2);
  btns[3] = new IGButton("Drag", x, y, w, h, color(80, 50, 10), 2, 28);
}

void draw(){
  background(100);
  for (int i=0;i<btnCount; i++){
    btns[i].create();
  }
}

// Begin Processing mouse events
void mousePressed(){
  if (btns[0].isOver(mouseX, mouseY)){
    btns[0].changeSize(-20, -20);
  }
}

void mouseReleased(){
  btns[0].reset();
  btns[2].reset();
  btns[3].reset();
}

void mouseClicked(){
  if (btns[1].isOver(mouseX, mouseY)){
    btns[1].reset();
    // make button bouncy 
    //params are for dist and rate
    btns[1].setJitter(25, PI/15.0);
  }
}

void mouseMoved(){
  // set general hover states
  for (int i=0;i<4; i++){
    if (i!=2){
      if (btns[i].isOver(mouseX, mouseY)){
        btns[i].setColor(btns[i].hoverC);
      } 
      else {
        btns[i].setColor(btns[i].initC);
      }
    }
  }
  
  // random color change on movement
  if (btns[2].isOver(mouseX, mouseY)){
    btns[2].setColor(color(random(255), random(255), random(255)));
  } 
  else {
    btns[2].setColor(btns[2].initC);
  }
}

void mouseDragged(){
  if (btns[3].isOver(mouseX, mouseY)){
    btns[3].setLoc(mouseX-btns[3].w/2, mouseY-btns[3].h/2);
  }
}




