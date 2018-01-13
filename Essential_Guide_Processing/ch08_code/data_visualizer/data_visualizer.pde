/**
 * Final Data Visualizer
 * Main Processing Tab
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.opengl.*;

Visualizer vo;

void setup(){
  size(600, 600, OPENGL);
  // get data
  XMLElement xml = new XMLElement(this, "widget_color_popularity.xml");
  
  // instaniate Visualizer object
  vo = new Visualizer(this, xml);
  noStroke();
}

void draw(){
  background(75);
  translate(width/2, height/2, -100);
  ambientLight(105, 105, 105);
  lightSpecular(200, 200, 200);
  directionalLight(250, 250, 250, 0, 1, -1);
  specular(190, 190, 230);
  shininess(25.0); 
  
  // start visualization
  vo.start();
}
















