/**
 * Data Visualizer  
 * Block.java class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.core.*;

public class Block extends VizObj{

  private float d = 1.0f;

  // default constructor
  public Block(){
  }

  // constructor
  public Block(PApplet p){
    super(p);
    init();
  }

  // constructor
  public Block(PApplet p, float sz){
    super(p, sz, sz);
    d = sz;
    init();
  }


  // constructor
  public Block(PApplet p, float w, float h, float d){
    super(p, w, h);
    this.d = d;
    init();
  }

  // required implementation - calculates geometry
  protected void init(){
    vecs = new PVector[8];
    vecs[0] = new PVector(loc.x-w/2, loc.y-h/2, loc.z+d/2);
    vecs[1] = new PVector(loc.x+w/2, loc.y-h/2, loc.z+d/2);
    vecs[2] = new PVector(loc.x+w/2, loc.y+h/2, loc.z+d/2);
    vecs[3] = new PVector(loc.x-w/2, loc.y+h/2, loc.z+d/2);

    vecs[4] = new PVector(loc.x-w/2, loc.y-h/2, loc.z-d/2);
    vecs[5] = new PVector(loc.x+w/2, loc.y-h/2, loc.z-d/2);
    vecs[6] = new PVector(loc.x+w/2, loc.y+h/2, loc.z-d/2);
    vecs[7] = new PVector(loc.x-w/2, loc.y+h/2, loc.z-d/2);
  }

  // required implementation - draws geometry
  public void create(PVector[] finalVecs){
    this.finalVecs = finalVecs;
    p.fill(r, g, b);
    p.beginShape(p.QUADS);
    // front
    p.vertex(finalVecs[0].x, finalVecs[0].y, finalVecs[0].z);
    p.vertex(finalVecs[1].x, finalVecs[1].y, finalVecs[1].z);
    p.vertex(finalVecs[2].x, finalVecs[2].y, finalVecs[2].z);
    p.vertex(finalVecs[3].x, finalVecs[3].y, finalVecs[3].z);

    // back
    p.vertex(finalVecs[5].x, finalVecs[5].y, finalVecs[5].z);
    p.vertex(finalVecs[4].x, finalVecs[4].y, finalVecs[4].z);
    p.vertex(finalVecs[7].x, finalVecs[7].y, finalVecs[7].z);
    p.vertex(finalVecs[6].x, finalVecs[6].y, finalVecs[6].z);

    // left
    p.vertex(finalVecs[4].x, finalVecs[4].y, finalVecs[4].z);
    p.vertex(finalVecs[0].x, finalVecs[0].y, finalVecs[0].z);
    p.vertex(finalVecs[3].x, finalVecs[3].y, finalVecs[3].z);
    p.vertex(finalVecs[7].x, finalVecs[7].y, finalVecs[7].z);

    // right
    p.vertex(finalVecs[1].x, finalVecs[1].y, finalVecs[1].z);
    p.vertex(finalVecs[5].x, finalVecs[5].y, finalVecs[5].z);
    p.vertex(finalVecs[6].x, finalVecs[6].y, finalVecs[6].z);
    p.vertex(finalVecs[2].x, finalVecs[2].y, finalVecs[2].z);

    // top
    p.vertex(finalVecs[0].x, finalVecs[0].y, finalVecs[0].z);
    p.vertex(finalVecs[4].x, finalVecs[4].y, finalVecs[4].z);
    p.vertex(finalVecs[5].x, finalVecs[5].y, finalVecs[5].z);
    p.vertex(finalVecs[1].x, finalVecs[1].y, finalVecs[1].z);

    // bottem
    p.vertex(finalVecs[3].x, finalVecs[3].y, finalVecs[3].z);
    p.vertex(finalVecs[2].x, finalVecs[2].y, finalVecs[2].z);
    p.vertex(finalVecs[6].x, finalVecs[6].y, finalVecs[6].z);
    p.vertex(finalVecs[7].x, finalVecs[7].y, finalVecs[7].z);
    p.endShape();
  }

  // For use outside Interactor.java class
  public void create(){
    p.beginShape(p.QUADS);
    // front
    p.vertex(vecs[0].x, vecs[0].y, vecs[0].z);
    p.vertex(vecs[1].x, vecs[1].y, vecs[1].z);
    p.vertex(vecs[2].x, vecs[2].y, vecs[2].z);
    p.vertex(vecs[3].x, vecs[3].y, vecs[3].z);

    // back
    p.vertex(vecs[5].x, vecs[5].y, vecs[5].z);
    p.vertex(vecs[4].x, vecs[4].y, vecs[4].z);
    p.vertex(vecs[7].x, vecs[7].y, vecs[7].z);
    p.vertex(vecs[6].x, vecs[6].y, vecs[6].z);

    // left
    p.vertex(vecs[4].x, vecs[4].y, vecs[4].z);
    p.vertex(vecs[0].x, vecs[0].y, vecs[0].z);
    p.vertex(vecs[3].x, vecs[3].y, vecs[3].z);
    p.vertex(vecs[7].x, vecs[7].y, vecs[7].z);

    // right
    p.vertex(vecs[1].x, vecs[1].y, vecs[1].z);
    p.vertex(vecs[5].x, vecs[5].y, vecs[5].z);
    p.vertex(vecs[6].x, vecs[6].y, vecs[6].z);
    p.vertex(vecs[2].x, vecs[2].y, vecs[2].z);

    // top
    p.vertex(vecs[0].x, vecs[0].y, vecs[0].z);
    p.vertex(vecs[4].x, vecs[4].y, vecs[4].z);
    p.vertex(vecs[5].x, vecs[5].y, vecs[5].z);
    p.vertex(vecs[1].x, vecs[1].y, vecs[1].z);

    // bottem
    p.vertex(vecs[3].x, vecs[3].y, vecs[3].z);
    p.vertex(vecs[2].x, vecs[2].y, vecs[2].z);
    p.vertex(vecs[6].x, vecs[6].y, vecs[6].z);
    p.vertex(vecs[7].x, vecs[7].y, vecs[7].z);
    p.endShape();
  }
}


