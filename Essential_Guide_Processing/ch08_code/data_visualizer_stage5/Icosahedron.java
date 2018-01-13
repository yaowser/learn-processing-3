/**
 * Data Visualizer  
 * Icosahedron.java class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.core.*;

public class Icosahedron extends VizObj{

  private PVector[] terminals = new PVector[2];
  private PVector[] topPent = new PVector[5];
  private PVector[] bottomPent = new PVector[5];

  // default constructor
  public Icosahedron(){
  }

  // constructor
  public Icosahedron(PApplet p, float radius){
    super(p, radius);
    init();
  }

  // required implementation - calculates geometry
  public void init(){

    float theta = 0.0f;
    float dist1 = 0.0f;
    float dist2 = 0.0f;
    float triHt = 0.0f;
    float phi = p.TWO_PI/5.0f;

    // treat vecs as a stacked 1D array.
    vecs = new PVector[terminals.length + topPent.length + bottomPent.length];
    dist2 = p.dist(p.cos(0)*radius, p.sin(0)*radius, p.cos(phi)*radius,  p.sin(phi)*radius);
    dist1 = (float)(Math.sqrt(((dist2*dist2)-(radius*radius))));
    triHt = (float)(Math.sqrt((dist2*dist2)-((dist2/2)*(dist2/2))));

    terminals[0] = new PVector(loc.x, loc.y, loc.z + triHt/2.0f+dist1);
    terminals[1] = new PVector(loc.x, loc.y, loc.z -(triHt/2.0f+dist1));
    vecs[0] = terminals[0];
    vecs[1] = terminals[1];

    for (int i=0; i<topPent.length; i++){
      topPent[i] = new PVector(loc.x + p.cos(theta)*radius, loc.y + p.sin(theta)*radius, loc.z + triHt/2.0f);
      vecs[terminals.length+i] = topPent[i];
      theta+=phi;
    }

    theta = p.PI + phi;
    for (int i=0; i<topPent.length; i++){
      bottomPent[i] = new PVector(loc.x + p.cos(theta)*radius, loc.y + p.sin(theta)*radius, loc.z -triHt/2.0f);
      vecs[terminals.length+topPent.length + i] = bottomPent[i];
      theta+=phi;
    }
  }

  // required implementation - draws geometry
  public void create(PVector[] finalVecs){
    this.finalVecs = finalVecs;
    p.fill(r, g, b);
    int pos1 = terminals.length;
    int pos2 = terminals.length + topPent.length;
    p.beginShape(p.TRIANGLES);
    for (int i=0; i<topPent.length; i++){
      // icosahedron top
      if (i<topPent.length-1){
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[0].x, finalVecs[0].y, finalVecs[0].z);
        p.vertex(finalVecs[pos1 + i+1].x, finalVecs[pos1 + i+1].y, finalVecs[pos1 + i+1].z);
      } 
      else {
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[0].x, finalVecs[0].y, finalVecs[0].z);
        p.vertex(finalVecs[pos1].x, finalVecs[pos1].y, finalVecs[pos1].z);
      }

      // icosahedron bottom
      if (i<bottomPent.length-1){
        p.vertex(finalVecs[pos2 + i].x, finalVecs[pos2 + i].y, finalVecs[pos2 + i].z);
        p.vertex(finalVecs[1].x, finalVecs[1].y, finalVecs[1].z);
        p.vertex(finalVecs[pos2 + i + 1].x, finalVecs[pos2 + i + 1].y, finalVecs[pos2 + i + 1].z);
      } 
      else {
        p.vertex(finalVecs[pos2 + i].x, finalVecs[pos2 + i].y, finalVecs[pos2 + i].z);
        p.vertex(finalVecs[1].x, finalVecs[1].y, finalVecs[1].z);
        p.vertex(finalVecs[pos2].x, finalVecs[pos2].y, finalVecs[pos2].z);
      }
    }

    // icosahedron body
    for (int i=0; i<topPent.length; i++){
      if (i<topPent.length-2){
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[pos2 + i + 1].x, finalVecs[pos2 + i + 1].y, finalVecs[pos2 + i + 1].z);
        p.vertex(finalVecs[pos2 + i + 2].x, finalVecs[pos2 + i + 2].y, finalVecs[pos2 + i + 2].z);

        p.vertex(finalVecs[pos2 + i + 2].x, finalVecs[pos2 + i + 2].y, finalVecs[pos2 + i + 2].z);
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[pos1 + i+1].x, finalVecs[pos1 + i+1].y, finalVecs[pos1 + i+1].z);
      } 
      else if (i==topPent.length-2){
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[pos2 + i + 1].x, finalVecs[pos2 + i + 1].y, finalVecs[pos2 + i + 1].z);
        p.vertex(finalVecs[pos2].x, finalVecs[pos2].y, finalVecs[pos2].z);

        p.vertex(finalVecs[pos2].x, finalVecs[pos2].y, finalVecs[pos2].z);
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[pos1 + i+1].x, finalVecs[pos1 + i+1].y, finalVecs[pos1 + i+1].z);
      }
      else if (i==topPent.length-1){
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[pos2].x, finalVecs[pos2].y, finalVecs[pos2].z);
        p.vertex(finalVecs[pos2 + 1].x, finalVecs[pos2 + 1].y, finalVecs[pos2 + 1].z);

        p.vertex(finalVecs[pos2 + 1].x, finalVecs[pos2 + 1].y, finalVecs[pos2 + 1].z);
        p.vertex(finalVecs[pos1 + i].x, finalVecs[pos1 + i].y, finalVecs[pos1 + i].z);
        p.vertex(finalVecs[pos1].x, finalVecs[pos1].y, finalVecs[pos1].z);
      }
    }
    p.endShape();
  }

  // For use outside Interactor.java class
  public void create(){
    int pos1 = terminals.length;
    int pos2 = terminals.length + topPent.length;
    p.beginShape(p.TRIANGLES);
    for (int i=0; i<topPent.length; i++){
      // icosahedron top
      if (i<topPent.length-1){
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[0].x, vecs[0].y, vecs[0].z);
        p.vertex(vecs[pos1 + i+1].x, vecs[pos1 + i+1].y, vecs[pos1 + i+1].z);
      } 
      else {
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[0].x, vecs[0].y, vecs[0].z);
        p.vertex(vecs[pos1].x, vecs[pos1].y, vecs[pos1].z);
      }

      // icosahedron bottom
      if (i<bottomPent.length-1){
        p.vertex(vecs[pos2 + i].x, vecs[pos2 + i].y, vecs[pos2 + i].z);
        p.vertex(vecs[1].x, vecs[1].y, vecs[1].z);
        p.vertex(vecs[pos2 + i + 1].x, vecs[pos2 + i + 1].y, vecs[pos2 + i + 1].z);
      } 
      else {
        p.vertex(vecs[pos2 + i].x, vecs[pos2 + i].y, vecs[pos2 + i].z);
        p.vertex(vecs[1].x, vecs[1].y, vecs[1].z);
        p.vertex(vecs[pos2].x, vecs[pos2].y, vecs[pos2].z);
      }
    }

    // icosahedron body
    for (int i=0; i<topPent.length; i++){
      if (i<topPent.length-2){
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[pos2 + i + 1].x, vecs[pos2 + i + 1].y, vecs[pos2 + i + 1].z);
        p.vertex(vecs[pos2 + i + 2].x, vecs[pos2 + i + 2].y, vecs[pos2 + i + 2].z);

        p.vertex(vecs[pos2 + i + 2].x, vecs[pos2 + i + 2].y, vecs[pos2 + i + 2].z);
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[pos1 + i+1].x, vecs[pos1 + i+1].y, vecs[pos1 + i+1].z);
      } 
      else if (i==topPent.length-2){
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[pos2 + i + 1].x, vecs[pos2 + i + 1].y, vecs[pos2 + i + 1].z);
        p.vertex(vecs[pos2].x, vecs[pos2].y, vecs[pos2].z);

        p.vertex(vecs[pos2].x, vecs[pos2].y, vecs[pos2].z);
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[pos1 + i+1].x, vecs[pos1 + i+1].y, vecs[pos1 + i+1].z);
      }
      else if (i==topPent.length-1){
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[pos2].x, vecs[pos2].y, vecs[pos2].z);
        p.vertex(vecs[pos2 + 1].x, vecs[pos2 + 1].y, vecs[pos2 + 1].z);

        p.vertex(vecs[pos2 + 1].x, vecs[pos2 + 1].y, vecs[pos2 + 1].z);
        p.vertex(vecs[pos1 + i].x, vecs[pos1 + i].y, vecs[pos1 + i].z);
        p.vertex(vecs[pos1].x, vecs[pos1].y, vecs[pos1].z);
      }
    }
    p.endShape();
  }

}














