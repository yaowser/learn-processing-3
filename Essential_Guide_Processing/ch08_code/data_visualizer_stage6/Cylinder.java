/**
 * Data Visualizer  
 * Cylinder.java class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.core.*;

public class Cylinder extends VizObj{

  private int detail = 12;

  // default constructor
  public Cylinder(){
  }

  // constructor
  public Cylinder(PApplet p){
    super(p);
    init();
  }

  // constructor
  public Cylinder(PApplet p, float w, float h){
    super(p, w, h);
    init();
  }

  // constructor
  public Cylinder(PApplet p, float w, float h, int detail){
    super(p, w, h);
    this.detail = detail;
    init();
  }

  // required implementation - calculates geometry
  protected void init(){
    float theta = 0.0f;
    float y = -h/2;
    vecs = new PVector[detail*2];
    for (int i=0; i<vecs.length; i++){
      vecs[i] = new PVector(loc.x + p.sin(theta)*w, loc.y + y, loc.z + p.cos(theta)*w);
      theta += p.TWO_PI/(vecs.length/2);
      if (i == vecs.length/2-1){
        y += h;
        theta = 0.0f;
      }
    }
  }

  // required implementation - draws geometry
  public void create(PVector[] finalVecs){
    this.finalVecs = finalVecs;
    p.fill(r, g, b);
    int id = finalVecs.length/2;
    p.beginShape(p.QUADS);
    for (int i=1; i<finalVecs.length/2; i++){

      p.vertex(finalVecs[i-1].x, finalVecs[i-1].y, finalVecs[i-1].z);
      p.vertex(finalVecs[i].x, finalVecs[i].y, finalVecs[i].z);
      p.vertex(finalVecs[id + i].x, finalVecs[id + i].y, finalVecs[id + i].z);
      p.vertex(finalVecs[id + i-1].x, finalVecs[id +i-1].y, finalVecs[id +i-1].z);

      if (i == finalVecs.length/2-1){
        p.vertex(finalVecs[i].x, finalVecs[i].y, finalVecs[i].z);
        p.vertex(finalVecs[0].x, finalVecs[0].y, finalVecs[0].z);
        p.vertex(finalVecs[id].x, finalVecs[id].y, finalVecs[id].z);
        p.vertex(finalVecs[id + i].x, finalVecs[id +i].y, finalVecs[id +i].z);
      } 
    }
    p.endShape();

    // seal cap
    p.beginShape();
    for (int i=0; i<finalVecs.length/2; i++){
      p.vertex(finalVecs[i].x, finalVecs[i].y, finalVecs[i].z);
    }
    p.endShape(p.CLOSE);

    // seal cap
    p.beginShape();
    for (int i=finalVecs.length/2; i<finalVecs.length; i++){
      p.vertex(finalVecs[i].x, finalVecs[i].y, finalVecs[i].z);
    }
    p.endShape(p.CLOSE);
  }

  // For use outside Interactor.java class
  public void create(){
    int id = vecs.length/2;
    p.beginShape(p.QUADS);
    for (int i=1; i<vecs.length/2; i++){

      p.vertex(vecs[i-1].x, vecs[i-1].y, vecs[i-1].z);
      p.vertex(vecs[i].x, vecs[i].y, vecs[i].z);
      p.vertex(vecs[id + i].x, vecs[id + i].y, vecs[id + i].z);
      p.vertex(vecs[id + i-1].x, vecs[id +i-1].y, vecs[id +i-1].z);

      if (i == vecs.length/2-1){
        p.vertex(vecs[i].x, vecs[i].y, vecs[i].z);
        p.vertex(vecs[0].x, vecs[0].y, vecs[0].z);
        p.vertex(vecs[id].x, vecs[id].y, vecs[id].z);
        p.vertex(vecs[id + i].x, vecs[id +i].y, vecs[id +i].z);
      } 
    }
    p.endShape();

    // seal cap
    p.beginShape();
    for (int i=0; i<vecs.length/2; i++){
      p.vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    p.endShape(p.CLOSE);

    // seal cap
    p.beginShape();
    for (int i=vecs.length/2; i<vecs.length; i++){
      p.vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    p.endShape(p.CLOSE);
  }

  // updates vertices and calculates joint position to add blocks
  protected void update(){
    joint = new PVector();
    for (int i=vecs.length/2-1; i<vecs.length; i++){
      joint.add(vecs[i]);
    }
    joint.div(vecs.length/2);
    joint.add(loc);

    // add location to vertices 
    for (int i=0; i<vecs.length; i++){
      vecs[i].add(loc);
    }
  }
}

























































