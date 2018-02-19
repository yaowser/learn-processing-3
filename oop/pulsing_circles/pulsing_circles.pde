// Create an ArrayList (these are AWESOME dynamic arrays you can make in Processing) 
// to hold onto all of the Pulsar objects I create.
ArrayList<Pulsar> pulsars = new ArrayList<Pulsar>();

// declare variables to use as we instantiate Pulsar objects.
color randomColor;
float randomRadius;
int lastPulsar;
float maxRadius;
float minRadius = 2;

void setup()
{
  size(500,500);         // set background size
  maxRadius = width/3;   // set max size of circles
  background(255);       // make background white
}

void draw()
{
   background(255);  // make background white again.  Putting this here again functions as an "erase"
   
   // Show and pulse the Pulsar objects that will be created when you instantiate them in the mousePressed()
   // function below.  
   for(int i = 0; i< pulsars.size(); i++)
   {
   pulsars.get(i).display();
   pulsars.get(i).pulse();
   //pulsars.get(i).shrink();
   }

}

void mousePressed()
{
  
  // random red values
  randomColor = color(random(100,255),0,0);
  randomRadius = random(2,maxRadius);  // choose a radius from a range that makes the cirlces different
  
  // create a new Pulsar object at the location of the click and put it in the ArrayList
  // you've created above
  pulsars.add(new Pulsar(mouseX,mouseY,randomColor, randomRadius));
  
  // we need to keep track of the last one we put in the array list
  lastPulsar = pulsars.size()-1;
  
  // grab the Pulsar object you just made, display it and pulse it.
  pulsars.get(lastPulsar).display();
 // pulsars.get(lastPulsar).pulse();
  pulsars.get(lastPulsar).shrink();
  
}

// This is the class I made.  If you'd like to read more about how to use Classes, Objects and
// more about Object Oriented Programming (OOP) in general, check out this great tutorial
// https://processing.org/tutorials/objects/

class Pulsar
{
  // data  
  //
  // This is where I'm declaring the attributes I need to keep track of
  // for each of my Pulsar objects that I create.  Pulsar is just my fancy word for a 
  // cirlce I'm creating.  I want to make lots of them.
  
  color c; 
  float radius;
  float changingRadius;
  float xPos;
  float yPos;
  int isGrowing = 1;  // I use this like an on/off switch to keep track of if my Pulsar should be growing or not
  
  // constructor 
  //
  // This is where I make sure each Pulsar object I create can access the variables
  // I've created above.
  Pulsar(float _xPos, float _yPos, color _c, float _radius) {
    c = _c;
    radius = _radius;
    xPos = _xPos;
    yPos = _yPos;
    changingRadius = radius;
    }
  
  // methods
  //
  // These are the subroutines that allow my Pulsar objects to do things.
  
  
  // I want my Pulsar objects to show up on screen.  This gives them the attribues they need to 
  // show up.
  void display()
  {
   noStroke();
   fill(c);
   ellipseMode(CENTER);
   ellipse(xPos,yPos,changingRadius,changingRadius);
   //println("display");
  }
 
 // this is a function that allows me to quickly make the radius get bigger.
  void grow()
  {
    changingRadius++;
  }
  
  // this, like the growing radius function above allows me to make the raidus get smaller.  Both
  // of these functions are kinda silly and probably unnecessary.
  void shrink()
  {
    changingRadius--;
    //println("secondRadius" + changingRadius);
  }
  
  // this is the most complex method.  It checks four cases and creates certain behavior based on
  // which case is true at any given time through the void draw() loop.
  void pulse()
  {
    // if the Pulsar object isn't at its max size yet and is getting bigger...
    if(changingRadius < maxRadius && isGrowing == 1)
    {
      // ... then let it keep getting bigger.
      changingRadius++;
     // println("growing");    // used for debugging...
    }
    
    // if the radius gets to its maximum value...
    if(changingRadius >= maxRadius)
    {
      // then switch isGrowing to "off" by setting it to zero... think of it as "false"
      isGrowing = 0; 
      //println("max value");   // used for debugging...
    }
    
    // if radius is bigger than the minimum value and it is shrinking...
    if(changingRadius > minRadius && isGrowing == 0)
    {
      // let it keep shrinking...
      changingRadius--; 
      //println("shrinking");   // used for debugging...
    }
    
    // if the radius reaches its mininmum value...
    if(changingRadius <= minRadius)
    {
      // ... let it start growing again
      isGrowing = 1; 
      //println("min value");    // used for debugging...
    }
  }
  
}