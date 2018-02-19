// Example of using objects for OOP

// Author: David Coelho
// Last Update: 2016-04-18

// Import Libraries

// Don't need new libraries for this example

// Init Variables

int unit = 50;  // cte to define the number of objects
int count = 0;  // number of objects
Module[] mods;  // array of objects
int index = 0;  // index of object to be initialized

// Program Boot (Initialization)
void setup() 
{
  // size of canvas
  size(640, 360);
  
  // Objects don't have borders
  noStroke();
  
  // Define number of objects
  int wideCount = width / unit;    // number of objects at a line
  int highCount = height / unit;   // number of lines
  count = wideCount * highCount;   // number of objects
  mods = new Module[count];        // init array of modules
  
  // Initialize each object
  for (int y = 0; y < highCount; y++) 
    for (int x = 0; x < wideCount; x++) 
      mods[index++] = new Module(x*unit, y*unit, unit/2, unit/2, random(0.05, 0.8), unit);
}

// Main Loop (repeats indefinitely)
void draw() 
{
  // Clear canvas
  background(0);
  
  // Update each module postion and paint it at canvas
  for (Module mod : mods) 
  {
    mod.update();
    mod.drawing();
  }
}


// Class definition
class Module 
{
  // Internal Variables
  int xOffset;
  int yOffset;
  float x, y;
  int unit;
  int xDirection = 1;
  int yDirection = 1;
  float speed; 
  
  // Contructor
  Module(int xOffsetTemp, int yOffsetTemp, int xTemp, int yTemp, float speedTemp, int tempUnit) 
  {
    xOffset = xOffsetTemp;
    yOffset = yOffsetTemp;
    x = xTemp;
    y = yTemp;
    speed = speedTemp;
    unit = tempUnit;
  }
  
  // Custom method for updating the variables
  void update() 
  {
    x = x + (speed * xDirection);
    if (x >= unit || x <= 0) 
    {
      xDirection *= -1;
      x = x + (1 * xDirection);
      y = y + (1 * yDirection);
    }
    if (y >= unit || y <= 0) 
    {
      yDirection *= -1;
      y = y + (1 * yDirection);
    }
  }
  
  // Custom method for drawing the object
  void drawing() 
  {
    fill(255);
    ellipse(xOffset + x, yOffset + y, 6, 6);
  }
}