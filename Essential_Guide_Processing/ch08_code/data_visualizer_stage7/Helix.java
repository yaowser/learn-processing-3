/**
 * Data Visualizer  
 * Helix.java class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

import processing.core.*;

public class Helix extends VizObj{

  //instance properties with default values
  private int rots = 1, helixDetail = 24;
  protected PVector[] path;
  protected float tubeRadius = 4.0f;
  private int tubeDetail = 12;

  // default constructor
  public Helix(){
  }

  // constructor
  public Helix(PApplet p){
    super(p);
    init();
  } 

  // constructor
  public Helix(PApplet p, float w, float h, int rots){
    super(p, w, h);
    this.rots = rots;
    init();
  }

  // constructor
  public Helix(PApplet p, float w, float h, int rots, int helixDetail){
    super(p, w, h);
    this.rots = rots;
    this.helixDetail = helixDetail;
    init();
  }

  // constructor
  public Helix(PApplet p, float w, float h, int rots, int helixDetail, 
  float tubeRadius, int tubeDetail){
    super(p, w, h);
    this.rots = rots;
    this.helixDetail = helixDetail;
    this.tubeRadius = tubeRadius;
    this.tubeDetail = tubeDetail;
    init();
  }

  // required implementation - calculates geometry
  protected void init(){
    // generate spiral path for helix
    path = new PVector[helixDetail];
    vecs = new PVector[path.length*tubeDetail];
    float helixTheta = 0.0f;  
    float offset = h/helixDetail;

    for (int i=0; i<path.length; i++){
      path[i] = new PVector(p.sin(helixTheta)*w/2.0f, -h/2.0f+offset*i,  
      p.cos(helixTheta)*w/2.0f);
      float tubeTheta = 0.0f;
      for (int j=0; j<tubeDetail; j++){
        // create cross-sections around helix, with uncorrected y-rotation
        PVector temp = new PVector(0, p.cos(tubeTheta)*tubeRadius,  
        p.sin(tubeTheta)*tubeRadius);
        // correct for y rotation of cross-section.
        PVector fixed = new PVector(p.sin(helixTheta)*temp.z - p.cos(helixTheta)*  
          temp.x, temp.y, p.cos(helixTheta)*temp.z + p.sin(helixTheta)*temp.x);
        // populate vecs array with cross-section vertices, at Path vertex positions.
        vecs[tubeDetail*i + j] = new PVector(path[i].x + fixed.x, path[i].y +  
          fixed.y, path[i].z + fixed.z);
        tubeTheta += p.TWO_PI/tubeDetail;
      }
      helixTheta += p.TWO_PI/helixDetail*rots;
    } 
  }

  /* required implementation - draws geometry
   patch helix body with quads, includes
   solid and gradient rendering options */
  public void create(PVector[] finalVecs){
    this.finalVecs = finalVecs;
    // gradient rendering option
    if (arrR != null && arrG != null && arrB != null ){
      // gradient start cap 
      p.fill(arrR[0], arrG[0], arrB[0]);
      p.beginShape();
      for (int i=0; i<tubeDetail; i++){
        p.vertex(finalVecs[i].x, finalVecs[i].y, finalVecs[i].z);
      }
      p.endShape(p.CLOSE);
      // body
      p.beginShape(p.QUADS);
      for (int i=1; i<path.length; i++){
        for (int j=1; j<tubeDetail; j++){
          if (j == tubeDetail-1){
            p.fill(arrR[i-1], arrG[i-1], arrB[i-1]);
            p.vertex(finalVecs[tubeDetail*(i-1)+(j-1)].x, finalVecs[tubeDetail*(i-1)+(j-1)].y,  
            finalVecs[tubeDetail*(i-1)+(j-1)].z);
            p.fill(arrR[i], arrG[i], arrB[i]);
            p.vertex(finalVecs[tubeDetail*(i)+(j-1)].x, finalVecs[tubeDetail*(i)+(j-1)].y,  
            finalVecs[tubeDetail*(i)+(j-1)].z);
            p.fill(arrR[i], arrG[i], arrB[i]);
            p.vertex(finalVecs[tubeDetail*(i)+(0)].x, finalVecs[tubeDetail*(i)+(0)].y,  
            finalVecs[tubeDetail*(i)+(0)].z);
            p.fill(arrR[i-1], arrG[i-1], arrB[i-1]);
            p.vertex(finalVecs[tubeDetail*(i-1)+(0)].x, finalVecs[tubeDetail*(i-1)+(0)].y,  
            finalVecs[tubeDetail*(i-1)+(0)].z);
          } 
          p.fill(arrR[i-1], arrG[i-1], arrB[i-1]);
          p.vertex(finalVecs[tubeDetail*(i-1)+(j-1)].x, finalVecs[tubeDetail*(i-1)+(j-1)].y,  
          finalVecs[tubeDetail*(i-1)+(j-1)].z);
          p.fill(arrR[i], arrG[i], arrB[i]);
          p.vertex(finalVecs[tubeDetail*(i)+(j-1)].x, finalVecs[tubeDetail*(i)+(j-1)].y,  
          finalVecs[tubeDetail*(i)+(j-1)].z);
          p.fill(arrR[i], arrG[i], arrB[i]);
          p.vertex(finalVecs[tubeDetail*(i)+(j)].x, finalVecs[tubeDetail*(i)+(j)].y,  
          finalVecs[tubeDetail*(i)+(j)].z);
          p.fill(arrR[i-1], arrG[i-1], arrB[i-1]);
          p.vertex(finalVecs[tubeDetail*(i-1)+(j)].x, finalVecs[tubeDetail*(i-1)+(j)].y,  
          finalVecs[tubeDetail*(i-1)+(j)].z);
        }
      } 
      p.endShape();
      // gradient end cap
      p.beginShape();
      p.fill(arrR[arrR.length-1], arrG[arrG.length-1], arrB[arrB.length-1]);
      for (int i=0; i<tubeDetail; i++){
        int j = tubeDetail*(path.length-1) + i;
        p.vertex(finalVecs[j].x, finalVecs[j].y, finalVecs[j].z);
      }
      p.endShape(p.CLOSE);
    } 
    else {
      // BEGIN solid color rendering
      // solid start cap
      p.fill(r, g, b);
      p.beginShape();
      for (int i=0; i<tubeDetail; i++){
        p.vertex(finalVecs[i].x, finalVecs[i].y, finalVecs[i].z);
      }
      p.endShape(p.CLOSE);
      // body
      p.beginShape(p.QUADS);
      for (int i=1; i<path.length; i++){
        for (int j=1; j<tubeDetail; j++){
          if (j == tubeDetail-1){
            p.vertex(finalVecs[tubeDetail*(i-1)+(j-1)].x, finalVecs[tubeDetail*(i-1)+(j-1)].y,  
            finalVecs[tubeDetail*(i-1)+(j-1)].z);
            p.vertex(finalVecs[tubeDetail*(i)+(j-1)].x, finalVecs[tubeDetail*(i)+(j-1)].y,  
            finalVecs[tubeDetail*(i)+(j-1)].z);
            p.vertex(finalVecs[tubeDetail*(i)+(0)].x, finalVecs[tubeDetail*(i)+(0)].y,  
            finalVecs[tubeDetail*(i)+(0)].z);
            p.vertex(finalVecs[tubeDetail*(i-1)+(0)].x, finalVecs[tubeDetail*(i-1)+(0)].y,  
            finalVecs[tubeDetail*(i-1)+(0)].z);
          } 
          p.vertex(finalVecs[tubeDetail*(i-1)+(j-1)].x, finalVecs[tubeDetail*(i-1)+(j-1)].y,  
          finalVecs[tubeDetail*(i-1)+(j-1)].z);
          p.vertex(finalVecs[tubeDetail*(i)+(j-1)].x, finalVecs[tubeDetail*(i)+(j-1)].y,  
          finalVecs[tubeDetail*(i)+(j-1)].z);
          p.vertex(finalVecs[tubeDetail*(i)+(j)].x, finalVecs[tubeDetail*(i)+(j)].y,  
          finalVecs[tubeDetail*(i)+(j)].z);
          p.vertex(finalVecs[tubeDetail*(i-1)+(j)].x, finalVecs[tubeDetail*(i-1)+(j)].y, 
          finalVecs[tubeDetail*(i-1)+(j)].z);
        }
      }
      p.endShape();
      // solid end cap
      p.beginShape();
      p.fill(r, g, b);
      for (int i=0; i<tubeDetail; i++){
        int j = tubeDetail*(path.length-1) + i;
        p.vertex(finalVecs[j].x, finalVecs[j].y, finalVecs[j].z);
      }
      p.endShape(p.CLOSE);
    }
  }

  // For use outside Interactor.java class
  public void create(){
    // patch helix body with quads
    p.beginShape(p.QUADS);
    for (int i=1; i<path.length; i++){
      for (int j=1; j<tubeDetail; j++){
        if (j == tubeDetail-1){
          p.vertex(vecs[tubeDetail*(i-1)+(j-1)].x, vecs[tubeDetail*(i-1)+(j-1)].y,  
          vecs[tubeDetail*(i-1)+(j-1)].z);
          p.vertex(vecs[tubeDetail*(i)+(j-1)].x, vecs[tubeDetail*(i)+(j-1)].y,  
          vecs[tubeDetail*(i)+(j-1)].z);
          p.vertex(vecs[tubeDetail*(i)+(0)].x, vecs[tubeDetail*(i)+(0)].y,  
          vecs[tubeDetail*(i)+(0)].z);
          p.vertex(vecs[tubeDetail*(i-1)+(0)].x, vecs[tubeDetail*(i-1)+(0)].y,  
          vecs[tubeDetail*(i-1)+(0)].z);
        } 
        p.vertex(vecs[tubeDetail*(i-1)+(j-1)].x, vecs[tubeDetail*(i-1)+(j-1)].y,  
        vecs[tubeDetail*(i-1)+(j-1)].z);
        p.vertex(vecs[tubeDetail*(i)+(j-1)].x, vecs[tubeDetail*(i)+(j-1)].y,  
        vecs[tubeDetail*(i)+(j-1)].z);
        p.vertex(vecs[tubeDetail*(i)+(j)].x, vecs[tubeDetail*(i)+(j)].y,  
        vecs[tubeDetail*(i)+(j)].z);
        p.vertex(vecs[tubeDetail*(i-1)+(j)].x, vecs[tubeDetail*(i-1)+(j)].y,  
        vecs[tubeDetail*(i-1)+(j)].z);
      }
    }
    p.endShape();

    // add end caps
    p.beginShape();
    for (int i=0; i<tubeDetail; i++){
      p.vertex(vecs[i].x, vecs[i].y, vecs[i].z);
    }
    p.endShape(p.CLOSE);

    p.beginShape();
    for (int i=0; i<tubeDetail; i++){
      int j = tubeDetail*(path.length-1) + i;
      p.vertex(vecs[j].x, vecs[j].y, vecs[j].z);
    }
    p.endShape(p.CLOSE);
  }

  // returns number of vertices in path (spine of helix)
  public int getHelixDetail() {
    return helixDetail;
  }
}


