/**
 * Draw Game
 * Pattern class - outputs pattern jpg
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Pattern{

  // properties with defaults
  float patternScaleWFactor = 2;
  float patternScaleHFactor = 2;
  float cellScaleWFactor = .5;
  float cellScaleHFactor = .5;
  String patternName;

  // Default constructor
  Pattern(){
    init();
  }

  // constructor
  Pattern(float patternScaleWFactor, float patternScaleHFactor, float cellScaleWFactor, float cellScaleHFactor, String patternName){
    this.patternScaleWFactor = patternScaleWFactor;
    this.patternScaleHFactor = patternScaleHFactor;
    this.cellScaleWFactor = cellScaleWFactor;
    this.cellScaleHFactor = cellScaleHFactor;
    this.patternName = patternName;
  }

  // constructor (with auto naming)
  Pattern(float patternScaleWFactor, float patternScaleHFactor, float cellScaleWFactor, float cellScaleHFactor){
    this.patternScaleWFactor = patternScaleWFactor;
    this.patternScaleHFactor = patternScaleHFactor;
    this.cellScaleWFactor = cellScaleWFactor;
    this.cellScaleHFactor = cellScaleHFactor;
    init();
  }

  // ensure pattern name is unique
  void init(){
    patternName = "pattern_"+year()+month()+day()+hour()+minute()+second();
  }

  // make beautiful pattern
  void create(){
    //Create PImage to output
    PImage img = createImage(int(width*patternScaleWFactor), int(height*patternScaleHFactor), RGB);
    // create PImage based on current sketch dimension
    PImage imgC = createImage(width, height, RGB);
    // populate global(screen) pixel array
    loadPixels();
    // copy pixels
    imgC.pixels = pixels;
    // scale image
    imgC.resize(width*=cellScaleWFactor, height*=cellScaleHFactor);
    // calculate ratio of external image to tile
    int tileWidthCount = img.width/imgC.width;
    int tileHeightCount = img.height/imgC.height;
    // create tiled pattern
    // nested loops based on tiled count and source tile dimensions
    for (int g=0; g<tileHeightCount; g++){
      for (int h=0; h<tileWidthCount; h++){
        for (int i=0; i<imgC.height; i++){
          for (int j=0; j<imgC.width; j++){
            img.pixels[img.width*i + img.width*imgC.height*g + j + imgC.width*h] = imgC.pixels[i*imgC.width + j];
          }
        }
      }
    }
    // save file to current sketch directory/patterns
    img.save("patterns/"+patternName);
  }

  // getters/setters
  void setPatternScale(float patternScaleWFactor, float patternScaleHFactor){
    this.patternScaleWFactor = patternScaleWFactor;
    this.patternScaleHFactor = patternScaleHFactor;
  }

  void setCellScale(float cellScaleWFactor, float cellScaleHFactor){
    this.cellScaleWFactor = cellScaleWFactor;
    this.cellScaleHFactor = cellScaleHFactor;
  }

  void setPatternName(String patternName){
    this.patternName = patternName;
  }
}






