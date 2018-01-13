/**
 * Data Visualizer  
 * Interactor.java class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.core.*;
import java.awt.event.*;
import java.util.*;

public class Interactor extends PApplet{

  private VizObj vo;
  private PApplet p;

  private PVector[][] vecs;
  private PVector[][] vecs_rotY;
  private PVector[][] vecs_rotX;
  private PVector[][] finalVecs;

  private float mx, my;
  private float dx, dy;
  private boolean isSpunOn;
  private float damping = .985f;
  private float spdY, spdX;
  private float mouseXIn, mouseYIn;
  private float timeIn;
  private float rotSpd = 10.0f;

  // ArrayList used to dynamically reference VizObj objects
  private ArrayList objBin;

  // default constructor
  public Interactor(){
    objBin = new ArrayList();
  }

  // constructor with VizObj obj array
  public Interactor(VizObj[] vos){
    objBin = new ArrayList();
    for (int i=0; i<vos.length; i++){
      objBin.add(vos[i]);
    }
    init();
  }

  // constructor with single VizObj obj
  public Interactor(VizObj vo){
    objBin = new ArrayList();
    objBin.add(vo);
    init();
  }

  // update dynamics values
  public void setDynamics(float rotSpd, float damping){
    this.rotSpd = rotSpd;
    this.damping = damping;
  }

  // initialize stuff
  public void init(){
    this.p = ((VizObj)objBin.get(0)).p;
    vecs = new PVector[objBin.size()][0];
    vecs_rotY = new PVector[objBin.size()][0];
    vecs_rotX = new PVector[objBin.size()][0];
    finalVecs = new PVector[objBin.size()][0];

    for (int i=0; i<objBin.size(); i++){
      for (int j=0; j<((VizObj)objBin.get(i)).vecs.length; j++){
        vecs[i] = (PVector[])append(vecs[i], ((VizObj)objBin.get(i)).vecs[j]);
        vecs_rotY[i] = (PVector[])append(vecs_rotY[i], new PVector());
        vecs_rotX[i] = (PVector[])append(vecs_rotX[i], new PVector());
        finalVecs[i] = (PVector[])append(finalVecs[i], new PVector());
      }
      arrayCopy(vecs[i], finalVecs[i]);
    }

    // start visualization spinning
    isSpunOn = true;
    spdX = 4;
    spdY = 4;

    // allows Mouse events to be handled in this class
    p.registerMouseEvent(this); 
  }

  // add individual VizObj object
  public void addTo(VizObj vo){
    objBin.add(vo);
    init();
  }

  // add array of VizObj objects
  public void addTo(VizObj[] vos){
    for (int i=0; i<vos.length; i++){
      objBin.add(vos[i]);
    }
    init();
  }

  // add 2D array of VizObj objects
  public void addTo(VizObj[][] vos){
    for (int i=0; i<vos.length; i++){
      for (int j=0; j<vos[i].length; j++){
        objBin.add(vos[i][j]);
      }
    }
    init();
  }

  /* Access Processing Mouse events
   enabling event encapsulation */
  public void mouseEvent(MouseEvent event) {
    switch (event.getID()) {
    case MouseEvent.MOUSE_PRESSED:
      isSpunOn = false;
      mx = p.mouseX;
      my = p.mouseY;

      mouseXIn = p.mouseX;
      mouseYIn = p.mouseY;
      timeIn = millis();
      break;
    case MouseEvent.MOUSE_RELEASED:
      isSpunOn = true;
      update();
      // conditional used to avoid /0 calculation
      float tm = millis() - timeIn;
      if (tm==0) {
        tm=100;
      }
      spdX = ((p.mouseX - mouseXIn)/tm)*rotSpd;
      spdY = ((p.mouseY - mouseYIn)/tm)*rotSpd;
      break;
    case MouseEvent.MOUSE_CLICKED:
      // do something for mouse clicked
      break;
    case MouseEvent.MOUSE_DRAGGED:
      rot(radians((p.mouseX-mx)), -radians((p.mouseY-my)));
      break;
    case MouseEvent.MOUSE_MOVED:
      // do something for mouse moved
      break;
    }
  }

  // allows VizObj objects to be rotated
  public void runMouseEvents(){
    if (isSpunOn){
      rot(radians((spdX)), -radians((spdY)));
      update();
      spdX*=damping;
      spdY*=damping;
    }

    for (int i=0; i<objBin.size(); i++){
      VizObj vo = (VizObj)objBin.get(i);
      if(vo.isMouseEnabled && vo.isOver()){
        vo.updateRGB(vo.hoverR, vo.hoverG, vo.hoverB);
      }
      else {
        vo.updateRGB(vo.upR, vo.upG, vo.upB);
      }
    }
  }

  // returns VizObj object info property value
  public String getVizObjInfo(){
    for (int i=0; i<objBin.size(); i++){
      VizObj vo = (VizObj)objBin.get(i);
      if(vo.isMouseEnabled && vo.isOver()){
        return(vo.info);
      }
    }
    return "";
  }

  // rotate VizObj objects' vertices
  public void rot(float tx, float ty) {
    // pre calc trig vals
    float sx = sin(tx);
    float sy = sin(ty);
    float cx = cos(tx);
    float cy = cos(ty);

    // mouse drag along x-axis = y-axis rotation
    for ( int i=0; i<vecs.length; i++){
      for (int j=0; j<vecs[i].length; j++){
        vecs_rotY[i][j] = new PVector(sx*vecs[i][j].z + cx*vecs[i][j].x, vecs[i][j].y, cx*vecs[i][j].z - sx*vecs[i][j].x);
      }
      // mouse drag along y-axis = x-axis rotation
      for (int j=0; j<vecs[i].length; j++){
        vecs_rotX[i][j] = new PVector(vecs_rotY[i][j].x, cy*vecs_rotY[i][j].y - sy*vecs_rotY[i][j].z, sy*vecs_rotY[i][j].y + cy*vecs_rotY[i][j].z);
      }
      arrayCopy(vecs_rotX[i], finalVecs[i]);
    }
  }

  /* copy finalVecs array values to vecs array
   - updates transformations */
  public void update(){
    for ( int i=0; i<vecs.length; i++){
      arrayCopy(finalVecs[i], vecs[i]);
    }
  }

  /* call create() method for each VizObj object
   and do mouse events */
  public void run(){
    for (int i=0; i<objBin.size(); i++){
      ((VizObj)objBin.get(i)).create(finalVecs[i]);
    }
    runMouseEvents();
  }
}


