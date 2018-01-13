/**
 * Primitve Sampler, 
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */
// table config
float cellW, cellH;
int rows = 3;
int cols = 3;
float margin = 15; 

void setup(){
  size(400, 400, P3D);
  background(75);
  buildTable();
}

void buildTable(){
  // initiatlize local variables x, y
  float x = margin;
  float y  = x;
  cellW = (width - margin*2)/cols;
  cellH = (height- margin*2)/rows;
  for (int i=0; i<rows; i++){
    for (int j=0; j<cols; j++){
      // ensure default color values are reset
      fill(255);
      stroke(0);
      rect(x+cellW*(j), y+cellH*(i), cellW, cellH);
      drawPrim(i*cols+j, x+cellW*(j)+cellW/2, y+cellH*(i)+cellH/2);
    }   
  }
}

void drawPrim(int index, float x, float y){
  switch(index){
  case 0:
    // draw 500 random points
    stroke(0);
    for (int i=0; i<500; i++){
      point(random(x-cellW/2, x+cellW/2), random(y-cellH/2, y+cellH/2));
    }
    break;
  case 1:
    // draw 50 random lines
    stroke(0);
    for (int i=0; i<50; i++){
      line(random(x-cellW/2, x+cellW/2), random(y-cellH/2, y+cellH/2),
      random(x-cellW/2, x+cellW/2), random(y-cellH/2, y+cellH/2));
    }
    break;
  case 2:
    // draw 50 random rectangles
    fill(255);
    stroke(0);
    for (int i=0; i<50; i++){
      float rectW = random(5, 30);
      float rectH = random(5, 30);
      rect(random(x-cellW/2, x+cellW/2-rectW), 
      random(y-cellH/2, y+cellH/2-rectH),rectW, rectH);
    }
    break;
  case 3:
    // draw 50 random triangles
    fill(255);
    stroke(0);
    for (int i=0; i<50; i++){
      float radius = random(4, 20);
      float theta = random(TWO_PI);
      float tempX = random(x-cellW/2+radius, x+cellW/2-radius);
      float tempY = random(y-cellH/2+radius, y+cellH/2-radius);
      triangle(tempX+cos(theta)*radius, tempY+sin(theta)*radius,
      tempX+cos(theta+PI/1.5)*radius, tempY+sin(theta+PI/1.5)*radius,
      tempX+cos(theta+PI/1.5*2)*radius, tempY+sin(theta+PI/1.5*2)*radius);
    }
    break;
  case 4:
    // draw 50 arcs
    noFill();
    stroke(0);
    for (int i=0; i<50; i++){
      float start = random(PI/4);
      float end = random(start, TWO_PI);
      float rectW = random(5, 60);
      float rectH = random(5, 60);
      arc(random(x-cellW/2+rectW/2, x+cellW/2-rectW/2), 
      random(y-cellH/2+rectH/2, y+cellH/2-rectH/2), rectW, rectH, start, end);
    }
    break;
  case 5:
    // draw 50 quads
    fill(255);
    stroke(0);
    for (int i=0; i<50; i++){
      float radius = random(4, 20);
      float theta = random(TWO_PI);
      float jitterX = random(-8, 8);
      float jitterY = random(-8, 8);
      float tempX = random(x-cellW/2+radius+4, x+cellW/2-radius-4);
      float tempY = random(y-cellH/2+radius+4, y+cellH/2-radius-4);
      quad(tempX+cos(theta)*(radius+jitterX), tempY+sin(theta)*(radius+jitterY),
      tempX+cos(theta+PI/2)*(radius+jitterX), tempY+sin(theta+PI/2)*(radius+jitterY),
      tempX+cos(theta+PI)*(radius+jitterX), tempY+sin(theta+PI)*(radius+jitterY),
      tempX+cos(theta+PI*1.5)*(radius+jitterX), tempY+sin(theta+PI*1.5)*(radius+jitterY));
    }
    break;
  case 6:
    // draw 30 ellipses
    fill(255);
    stroke(0);
    for (int i=0; i<30; i++){
      float rectW = random(3, 40);
      float rectH = random(3, 40);
      ellipse(random(x-cellW/2+rectW/2, x+cellW/2-rectW/2), 
      random(y-cellH/2+rectH/2, y+cellH/2-rectH/2),rectW, rectH);
    }
    break;
  case 7:
    // draw 30 random boxes
    fill(230);
    noStroke();
    lights();
    for (int i=0; i<30; i++){
      float rectW = random(2, 25);
      float rectH = random(2, 25);
      float rectD = random(2, 25);
      pushMatrix();
      translate(random(x-cellW/2.75+rectW/2, x+cellW/2.75-rectW/2), 
      random(y-cellH/2.75+rectH/2, y+cellH/2.75-rectH/2), 5);
      rotateX(random(TWO_PI));
      rotateY(random(TWO_PI));
      rotateZ(random(TWO_PI));
      box(rectW, rectH, rectD);
      popMatrix();
    }
    break;
  case 8:
    // draw 30 random spheres
    fill(110);
    noStroke();
    lights();
    for (int i=0; i<30; i++){
      float radius = random(2, 13);
      pushMatrix();
      translate(random(x-cellW/2.5+radius, x+cellW/2.5-radius), 
      random(y-cellH/2.5+radius, y+cellH/2.5-radius), 10);
      rotateX(random(TWO_PI));
      rotateY(random(TWO_PI));
      rotateZ(random(TWO_PI));
      sphere(radius);
      popMatrix();
    }
    break;
  }
}


