/**
 * Data Visualizer  
 * Vizualizer.java class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.core.*;
import processing.xml.*;
import java.util.*;

public class Visualizer{

  private Interactor ia;
  private Helix helix;
  private Icosahedron[] icos;
  private Cylinder[][] bonds;
  private Block[][] cubes;
  private PApplet p;
  // for data
  private int count;
  private XMLElement[][] childNodes;
  private XMLElement xml;
  //text output
  private PFont font;

  // default constructor
  public Visualizer(){
  }

  // constructor
  public  Visualizer(PApplet p){
    this.p = p;
    ia = new Interactor();
    init();
  }

  // constructor
  public Visualizer(PApplet p, XMLElement xml){
    this.p = p;
    this.xml = xml;
    ia = new Interactor();
    init();
  }

  // constructor
  public  Visualizer(PApplet p, Interactor ia){
    this.p = p;
    this.ia = ia;
    init();
  }

  // update XML
  public void setXML(XMLElement xml){
    this.xml = xml;
    init();
  }

  // initialize stuff
  protected void init(){
    font = p.loadFont("Verdana-16.vlw");

    // get xml child count
    count = xml.getChildCount();
    //initialize and parse xml region data into arrays
    childNodes = new XMLElement[count][0];
    for (int i=0; i<count; i++){
      childNodes[i] = xml.getChild(i).getChildren();
    }

    // populate colors calculating weighted averages
    int avgR, avgG, avgB;
    int[]arrR = new int[count];
    int[]arrG = new int[count];
    int[]arrB = new int[count];
    int[][]cubeR = new int[count][0];
    int[][]cubeG = new int[count][0];
    int[][]cubeB = new int[count][0];
    int weightTotal = 0;
    for (int i=0; i<count; i++){
      // reset avgs.
      avgR = avgG = avgB = 0;
      weightTotal = 0;
      int len = childNodes[i].length;
      for (int j=0; j<len; j++){
        // color component values
        int r = childNodes[i][j].getIntAttribute("r");
        int g = childNodes[i][j].getIntAttribute("g");
        int b = childNodes[i][j].getIntAttribute("b");
        int weight = Integer.parseInt(childNodes[i][j].getContent());

        // create weighted avgs
        avgR += r*weight;
        avgG += g*weight;
        avgB += b*weight;
        weightTotal += weight;

        cubeR[i] = (int[])p.append(cubeR[i], r);
        cubeG[i] = (int[])p.append(cubeG[i], g);
        cubeB[i] = (int[])p.append(cubeB[i], b);

      }
      arrR[i] = avgR/weightTotal;
      arrG[i] = avgG/weightTotal;
      arrB[i] = avgB/weightTotal;
    }

    helix = new Helix(p, 325, 375, 2, count, 8, 36);
    helix.initRGB(arrR,  arrG,  arrB);
    icos = new Icosahedron[helix.path.length];
    for (int i=0; i<helix.path.length; i++){
      icos[i] = new Icosahedron(p, 20);
      icos[i].initRGB(helix.arrR[i], helix.arrG[i], helix.arrB[i]);
      icos[i].setLoc(helix.path[i]);
      icos[i].setMouseEnabled(true);
      icos[i].setInfo(xml.getChild(i).getStringAttribute("name"));
    }

    bonds = new Cylinder[count][0];
    cubes = new Block[count][0];

    for (int i=0; i<count; i++){
      int len = childNodes[i].length;
      for (int j=0; j<len; j++){
        int sz = p.round(p.random(helix.tubeRadius-5, helix.tubeRadius+5));
        bonds[i] = (Cylinder[])p.append(bonds[i], new Cylinder(p, 2, 40));
        bonds[i][j].initRGB(120, 120, 120); 
        /* Please note: order of operations of transformations is meaningful */
        // move to edge of icosahedron
        PVector bondShift = new PVector(0, bonds[i][j].h/2+icos[i].radius*.75f, 0);
        bonds[i][j].setLoc(bondShift);
        // angles to rotate bonds
        float theta = p.TWO_PI/len*j;  // around x-axis
        float phi = p.atan2(icos[i].loc.x, icos[i].loc.z); // around y-axis
        /* rotate bonds evenly around individual icosahedron
         and then again to align with vector to helix center */
        bonds[i][j].setRot(new PVector(theta, phi, 0));
        // move to each icosahedron
        bonds[i][j].setLoc(icos[i].loc);

        // add blocks
        int val = Integer.parseInt(childNodes[i][j].getContent());
        cubes[i] = (Block[])p.append(cubes[i], new Block(p, p.min(val, 25)));
        cubes[i][j].initRGB(cubeR[i][j], cubeG[i][j], cubeB[i][j]);
        cubes[i][j].setRot(new PVector(theta, phi, 0));

        // move to end of each bond
        cubes[i][j].setLoc(bonds[i][j].joint);
        cubes[i][j].setMouseEnabled(true);

        // set information that shows when mouse hover
        cubes[i][j].setInfo("color: "+ childNodes[i][j].getStringAttribute("name") +
          "\n["+childNodes[i][j].getStringAttribute("r")+", " +
          childNodes[i][j].getStringAttribute("g")+", "+
          childNodes[i][j].getStringAttribute("b")+
          "]\n"+ childNodes[i][j].getContent()+ " units");
      }
    }

    /* add geometry to Interactor object 
     to get transformed and rendered */
    ia.addTo(helix);
    ia.addTo(icos);
    ia.addTo(bonds);
    ia.addTo(cubes);
  }

  // starts visualizer
  public void start(){
    ia.run();
    p.fill(0);
    p.textFont(font);
    p.textMode(p.SCREEN);
    p.text(ia.getVizObjInfo(), p.width-160, p.height-75);
  }
}









































































