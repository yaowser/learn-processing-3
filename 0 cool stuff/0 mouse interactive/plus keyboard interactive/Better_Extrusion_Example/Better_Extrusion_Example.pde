/* Better Extrusion Example
 Arrow keys control segments (up/down)
 and extrusion length (left/right)
 's' key controls solid rendering
 'w' key controls wireframe rendering
 */

// begin as a flat cube
int segments = 1;
int pts = 8;
float rectWidth = 150, rectHeight = 100;
float extrudeLength;
boolean isSolid = true;
boolean isWireFrame = false;
// vertices arrays
float[]verticesX = new float[pts];
float[]verticesY = new float[pts];
float[]verticesZ = new float[pts];

void setup(){
  size(500, 300, P3D);
  float px, py, pz;
  float angle = 45;
  // initialize vertices
  // initially create 2 planes in the same position,
  for (int i=0; i<pts; i++){
    px = cos(radians(angle))*rectWidth/2;
    py = sin(radians(angle))*rectHeight/2;
    pz = 0;
    verticesX[i] = px;
    verticesY[i] = py;
    verticesZ[i] = pz;
    angle+=360/4;
  }
}

void draw(){
  background(25);
  lights();
  if(isWireFrame){
    noFill();
  } else {
    fill(100, 100, 175);
  }
  
  stroke(200);
  translate(width/2, height/2);
  rotateY(frameCount*PI/200);
  rotateZ(frameCount*PI/190);
  rotateX(frameCount*PI/180);
  extrude();
}

// add/subtract points to vertices arrays
// called from within Key event functions below
void setSegments(int seg){
  //increase/decrease segment count
  segments+=seg;

  /* 
   Temp array used to add another segment to vertices
   arrays. The x and y values don't change between planes.
   The extruded z values are calculated in extrude function 
   */
  float[][]inputArray = {
    {verticesX[0], verticesX[1], verticesX[2], verticesX[3]},
    {verticesY[0], verticesY[1], verticesY[2], verticesY[3]},
    {verticesZ[0], verticesZ[1], verticesZ[2], verticesZ[3]} 
  };

  // add new segment to vertices array, using 
  // Processing's splice() function
  verticesX = splice(verticesX, inputArray[0], verticesX.length);
  verticesY = splice(verticesY, inputArray[1], verticesY.length);
  verticesZ = splice(verticesZ, inputArray[2], verticesZ.length);    
}

void extrude(){
  // Calculate z positions of vertices
  float segmentWidth = extrudeLength/segments;
  for (int i=0; i<segments+1; i++){
    for (int j=0; j<4; j++){
      verticesZ[j+4*i] = -extrudeLength/2+segmentWidth*i;
    }
  }

  // render cross planes between segments
  if (isSolid){
    for (int i=0; i<segments+1; i++){
      beginShape();
      for (int j=0; j<4; j++){
        vertex(verticesX[j+4*i], verticesY[j+4*i], verticesZ[j+4*i]);
      }
      endShape(CLOSE);
    }
  }

  //render external skin
  for (int i=0; i<segments+1; i++){
    beginShape(QUAD_STRIP);
    for (int j=0; j<4; j++){
      if (i<segments){
        vertex(verticesX[j+4*i], verticesY[j+4*i], verticesZ[j+4*i]);
        vertex(verticesX[j+4*i+4], verticesY[j+4*i+4], 
             verticesZ[j+4*i+4]);
        if (j==3){
          //connnect  last vertices back to beginning
          // to close form
          vertex(verticesX[4*i], verticesY[4*i], verticesZ[4*i]);
          vertex(verticesX[4*i+4], verticesY[4*i+4], verticesZ[4*i+4]);
        }  
      }
    }
    endShape();
  }
}

/*
arrow keys control segments
 and extrusion length
 */
void keyPressed(){
  if(key == CODED) { 
    // segements
    if (keyCode == UP) { 
      if (segments<25){
        setSegments(1); 
      }
    } 
    else if (keyCode == DOWN) { 
      if (segments>1){
        setSegments(-1); 
      }
    } 

    // extrusion length
    if (keyCode == RIGHT) { 
      extrudeLength+=5; 
    } 
    else if (keyCode == LEFT) { 
      if (extrudeLength>0){
        extrudeLength-=5; 
      }
    } 
  }
  if (key =='s'){
    if (isSolid){
      isSolid=false;
    } else {
      isSolid=true;
    }
  }
  if (key =='w'){
    if (isWireFrame){
      isWireFrame=false;
    } else {
      isWireFrame=true;
    }
  }
}