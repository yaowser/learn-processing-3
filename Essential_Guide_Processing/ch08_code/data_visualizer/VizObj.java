/**
 * Data Visualizer  
 * VizObj.java class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.core.*;

abstract class VizObj{

  protected PVector[] vecs, finalVecs;
  protected PApplet p;
  protected PVector loc = new PVector();
  protected int r, g, b, upR, upG, upB, hoverR, hoverG, hoverB;
  protected int[] arrR, arrG, arrB;
  protected float radius, w, h;
  protected boolean isMouseEnabled;
  protected String info;
  // where things can attach
  protected PVector joint;

  // default constructor
  protected  VizObj(){
  }

  // constructor
  public VizObj(PApplet p){
    this.p = p;
  }

  // constructor
  public VizObj(PApplet p, float radius){
    this.p = p;
    this.radius = radius;
  }

  // constructor
  public VizObj(PApplet p, float w, float h){
    this.p = p;
    this.w = w;
    this.h = h;
    radius = (w+h)/4.0f;
  }

  // init Color
  public void initRGB(float r, float g, float b){
    this.r = upR = p.round(r);
    this.g = upG = p.round(g);
    this.b = upB = p.round(b);
    hoverR = p.round(r*=2.0f);
    hoverG = p.round(g*=2.0f);
    hoverB = p.round(b*=2.0f);
  }

  // for gradient rendering option
  public void initRGB(int[] arrR, int[] arrG, int[] arrB){
    this.arrR = arrR;
    this.arrG = arrG;
    this.arrB = arrB;
  }

  // update Color
  public void updateRGB(int r, int g, int b){
    this.r = r;
    this.g = g;
    this.b = b;
  }

  // rotate vertices
  public void setRot(PVector rot){
    // pre calc trig vals
    // x-axis rotation
    float cx = p.cos(rot.x);
    float sx = p.sin(rot.x);

    // y-axis rotation
    float cy = p.cos(rot.y);
    float sy = p.sin(rot.y);

    // z-axis rotation
    float cz = p.cos(rot.z);
    float sz = p.sin(rot.z);

    PVector[] tempVecs = new PVector[vecs.length];
    for (int i=0; i<vecs.length; i++){
      // x-axis rotation
      tempVecs[i] = new PVector (vecs[i].x, cx*vecs[i].y -  sx*vecs[i].z, sx*vecs[i].y + cx*vecs[i].z);
      // y-axis rotation
      vecs[i] = new PVector (sy*tempVecs[i].z + cy*tempVecs[i].x, tempVecs[i].y, cy*tempVecs[i].z - sy*tempVecs[i].x);
      // z-axis rotation
      tempVecs[i] = new PVector (cz*vecs[i].x - sz*vecs[i].y, sz*vecs[i].x + cz*vecs[i].y, vecs[i].z);
    }
    p.arrayCopy(tempVecs, vecs);
  }

  // returns if mouse is currently over object
  // - this is bare bones and not very accurate picking
  public boolean isOver(){
    float mx = p.mouseX;
    float my = p.mouseY;

    float tempX = 0.0f;
    float tempY = 0.0f;
    float tempZ = 0.0f;
    for (int i=0; i<finalVecs.length; i++){
      tempX += finalVecs[i].x;
      tempY += finalVecs[i].y;
      tempZ += finalVecs[i].z;
    }
    tempX /= finalVecs.length;
    tempY /= finalVecs.length;
    tempZ /= finalVecs.length;
    if(mx>p.screenX(tempX, tempY, tempZ)-radius && 
      mx<p.screenX(tempX, tempY, tempZ)+radius && 
      my>p.screenY(tempX, tempY, tempZ)-radius && 
      my<p.screenY(tempX, tempY, tempZ)+radius){
      return true;
    }
    return false;
  }

  // add location to vertices
  protected void update(){
    for (int i=0; i<vecs.length; i++){
      vecs[i].add(loc);
    }
  }

  // more setters below
  public void setPApplet(PApplet p){
    this.p = p;
  }

  public void setLoc(PVector loc){
    this.loc = loc;
    update();
  }

  // sets String info used in screen output
  public void setInfo(String info){
    this.info = info;
  }

  public PVector getJoint(){
    return joint;
  }

  protected void setMouseEnabled(boolean isMouseEnabled){
    this.isMouseEnabled = isMouseEnabled;
  }

  // abstract methods to be implemented in subclasses
  abstract void init();
  abstract void create(PVector[] finalVecs);
}


