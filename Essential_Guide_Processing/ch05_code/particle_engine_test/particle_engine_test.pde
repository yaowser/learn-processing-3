/**
 * Particle Engine
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

// create particle population
int particleCount = 300;
// instantiate particle array
Particle[] particles = new Particle[particleCount];
// declare emitter
Emitter emitter;
// explicitely set frameRate;
float myFrameRate = 60.0;

void setup(){
  size(600, 400);
  background(0);
  smooth();
  frameRate(myFrameRate);
  // instantiate particles
  for (int i=0; i<particleCount; i++){
    particles[i] = new Particle(random(1, 3), color(255, random(90, 128), 10), 2000, .85);
  }
  // instantiate emitter
  //emitter = new Emitter(new PVector(300, 100), new PVector(0, 0), 20, 10, arrows);
  emitter = new Emitter(new PVector(width/2, 100), myFrameRate, new PVector(0, -1), .5, particles);
}

void draw(){
  background(0);
  emitter.emit();
}








