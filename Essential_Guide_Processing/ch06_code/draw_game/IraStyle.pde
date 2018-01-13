/**
 * Draw Game
 * IraStyle class  – extends Style
 * - for custom drawing algorithm
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */
 
 class IraStyle extends Style{

  // instance properties for  geometry
  Shape cellCore;
  PVector[] verts;
  PVector[] outerVecs;
  PVector[] innerVecs;
  float intervalX, intervalY;
  int innerDetail;
  // Tri is a helper class that creates triangle data types
  Tri[] tris;

  // defalt constructor
  IraStyle(){
  }

  // overrides init() in Style
  void init(Cell c){
    super.init(c);
    // initialize geometry
    verts = new PVector[c.detail*4];
    outerVecs = new PVector[c.detail*4];
    innerVecs = new PVector[4 + (c.detail-1)*4];
    intervalX = (c.w-c.padding)/(c.detail+1);
    intervalY = (c.h-c.padding)/(c.detail+1);
    innerDetail = c.detail - 1;
    tris = new Tri[c.detail*4];
  }

  // overrides create()in Style
  void create(){
    // instantiate inner shape
    cellCore = new Shape((c.x+c.padding/2) + (c.w-c.padding)/2-c.coreSize.width/2, (c.y+c.padding/2) + (c.h-c.padding)/2-c.coreSize.height/2, c.coreSize.width, c.coreSize.height);
    // calculate internal geometry
    calcOuterGeom();
    // draw internal geometry
    if (c.getValue()==-1){
      // human player
      drawCurvilinear();
    } 
    else if (c.getValue()==1){
      // computer player
      drawLinear();
    } 
  }

  // unique method to this Style subclass
  void calcOuterGeom(){
    int counter = 0;
    // top
    for (int i=0; i<c.detail; i++){
      outerVecs[counter++] = new PVector ((c.x+c.padding/2)+intervalX + intervalX*i, (c.y+c.padding/2));
    }
    // right
    for (int i=0; i<c.detail; i++){
      outerVecs[counter++] = new PVector ((c.x+c.padding/2)+(c.w-c.padding), (c.y+c.padding/2)+intervalY + intervalY*i);
    } 
    //bottom
    for (int i=0; i<c.detail; i++){
      outerVecs[counter++] = new PVector ((c.x+c.padding/2)+(c.w-c.padding)-intervalX - intervalX*i, (c.y+c.padding/2)+(c.h-c.padding));
    } 
    //left
    for (int i=0; i<c.detail; i++){
      outerVecs[counter++] = new PVector ((c.x+c.padding/2), (c.y+c.padding/2)+(c.h-c.padding)-intervalY - intervalY*i);
    }
  }

  // overrides drawCurvilinear()in Style
  void drawCurvilinear(){
    // calculate inner edge points 
    float radius = (cellCore.w + cellCore.h)/4;
    float theta = -HALF_PI*1.5;
    float px = 0.0;
    float py = 0.0;

    for (int i=0; i<innerVecs.length; i++){
      px = (c.x+c.padding/2)+(c.w-c.padding)/2 + cos(theta)*radius;
      py = (c.y+c.padding/2)+(c.h-c.padding)/2 + sin(theta)*radius;
      innerVecs[i] = new PVector (px, py);
      theta += TWO_PI/innerVecs.length;
    }

    // cell core shape
    fill(c.cellCols[2]);
    noStroke();
    curveTightness(0);
    beginShape();
    for(int i=0; i<innerVecs.length; i++){
      vertex(innerVecs[i].x, innerVecs[i].y);
    }
    endShape(CLOSE);
    //
    noStroke();
    // cell internal shape
    fill(c.cellCols[1]);
    for(int i=0; i<outerVecs.length; i++){
      beginShape();
      if (i == outerVecs.length-1){
        curveVertex(innerVecs[0].x, innerVecs[0].y);
        curveVertex(innerVecs[i].x, innerVecs[i].y);
        curveVertex(outerVecs[i].x, outerVecs[i].y);
        curveVertex(innerVecs[0].x, innerVecs[0].y);
        curveVertex(innerVecs[i].x, innerVecs[i].y);
      }
      else {
        curveVertex(innerVecs[i+1].x, innerVecs[i+1].y);
        curveVertex(innerVecs[i].x, innerVecs[i].y);
        curveVertex(outerVecs[i].x, outerVecs[i].y);
        curveVertex(innerVecs[i+1].x, innerVecs[i+1].y);
        curveVertex(innerVecs[i].x, innerVecs[i].y);
      }
      endShape(CLOSE);
    }

    // optional draw vertices
    //fill(255, 255, 0);
    for(int i=0; i<innerVecs.length; i++){
      //ellipse(innerVecs[i].x, innerVecs[i].y, 5, 5);
    }

    for(int i=0; i<outerVecs.length; i++){
      //ellipse(outerVecs[i].x, outerVecs[i].y, 5, 5);
    }

  }

  // overrides drawLinear()in Style
  void drawLinear(){
    // calculate inner edge points 
    // **1 less than outer per edge)
    float intervalX = cellCore.w/c.detail;
    float intervalY = cellCore.h/c.detail;
    int counter = 0;


    // top
    innerVecs[counter++] = new PVector (cellCore.x, cellCore.y);
    for (int i=0; i< innerDetail; i++){
      innerVecs[counter++] = new PVector (cellCore.x+intervalX + intervalX*i, cellCore.y);
    }
    // right
    innerVecs[counter++] = new PVector (cellCore.x+cellCore.w, cellCore.y);
    for (int i=0; i< innerDetail; i++){
      innerVecs[counter++] = new PVector (cellCore.x+cellCore.w, cellCore.y+intervalY + intervalY*i);
    } 
    //bottom
    innerVecs[counter++] = new PVector (cellCore.x+cellCore.w, cellCore.y+cellCore.h);
    for (int i=0; i< innerDetail; i++){
      innerVecs[counter++] = new PVector (cellCore.x+cellCore.w-intervalX - intervalX*i, cellCore.y+cellCore.h);
    } 
    //left
    innerVecs[counter++] = new PVector (cellCore.x, cellCore.y+cellCore.h);
    for (int i=0; i< innerDetail; i++){
      innerVecs[counter++] = new PVector (cellCore.x, cellCore.y+cellCore.h-intervalY - intervalY*i);
    }


    // calculate triangles
    for(int i=0; i<tris.length; i++){
      if (i == tris.length-1){
        tris[i] = new Tri(innerVecs[i], outerVecs[i], innerVecs[0]);
      } 
      else {
        tris[i] = new Tri(innerVecs[i], outerVecs[i], innerVecs[i+1]);
      }
    }

    // cell core shape
    noStroke();
    fill(c.cellCols[2]);
    rect(cellCore.x, cellCore.y, cellCore.w, cellCore.h);
    // cell internal shape
    fill(c.cellCols[1]);
    for(int i=0; i<tris.length; i++){
      beginShape();
      vertex(tris[i].vecs[0].x, tris[i].vecs[0].y);
      vertex(tris[i].vecs[1].x, tris[i].vecs[1].y);
      vertex(tris[i].vecs[2].x, tris[i].vecs[2].y);
      endShape(CLOSE);
    }

    // optional draw vertices
    //fill(255, 255, 0);
    for(int i=0; i<innerVecs.length; i++){
      //ellipse(innerVecs[i].x, innerVecs[i].y, 5, 5);
    }

    for(int i=0; i<outerVecs.length; i++){
      //ellipse(outerVecs[i].x, outerVecs[i].y, 5, 5);
    }
  }

  // overrides getClone()in Style
  Style getClone(){
    /*returns new object of this class type.
     polymorphism allows more generic Style 
     return type to handle all Style subclasses*/
    return new IraStyle();
  }

}





