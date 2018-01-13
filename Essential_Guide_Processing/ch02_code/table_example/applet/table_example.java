import processing.core.*; 

import java.applet.*; 
import java.awt.*; 
import java.awt.image.*; 
import java.awt.event.*; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class table_example extends PApplet {

/**
 * Table Example, 
 * By Ira Greenberg <br />
 * Processing for Flash Developers,
 * Friends of ED, 2009
 */

// table config global variables
float cellW, cellH;
int rows = 3;
int cols = 3;
float margin = 15; 

public void setup(){
  size(400, 400);
  background(75);
  buildTable();
}

public void buildTable(){
  // initiatlize local variables x, y
  float x = margin;
  float y  = x;
  cellW = (width - margin*2)/cols;
  cellH = (height- margin*2)/rows;
  for (int i=0; i<rows; i++){
    for (int j=0; j<cols; j++){
      fill(255);
      stroke(0);
      rect(x+cellW*(j), y+cellH*(i), cellW, cellH);
    }   
  }
}


  static public void main(String args[]) {
    PApplet.main(new String[] { "table_example" });
  }
}
