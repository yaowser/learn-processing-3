/**
 * Draw Game
 * TTTBoard class - main organizing class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class TTTBoard extends Shape{

  // Instance Properties
  // table cell structure and cell style properties
  Cell[] cells = new Cell[9];
  Line[] lines = new Line[8];
  float cellW, cellH, cellPadding;
  /* default Style instantiation - encapsulates drawing algorithm
   that the cell uses to draw the computer/human player's mark.
   It is possible to pass in a custom Style object as well */
  Style style = new Style();
  // controls articulation of cell shapes
  int detail = 1;
  // ratio of inner cell shape core to cell shape
  float coreRatio = .75;
  // flag to control random size of cell shape core
  boolean isCoreRandom = false;
  // each cell has a 3 color array (background, main form and core of the form)
  color[][] cellCols;

  // events
  // used to set mouse pressed/released events on cells
  boolean isMouseEventReady = true;

  // flag is false when a win, loss or draw occurs
  boolean isGameOpen = true;

  // controls AI - level of intelligence (1-5)
  int intelligenceSeed = 2;

  // composed helper objects
  ShallowGreen shallowGreen; // AI
  Pattern pattern;  // final artwork

  // default constructor
  TTTBoard(){
    super(0, 0, width, height);
    initCellColors();
    init();
  }

  // constructor
  TTTBoard(float x, float y, float w, float h){
    super(x, y, w, h);
    initCellColors();
    init();
  }

  // constructor
  TTTBoard(int detail, float coreRatio, boolean isCoreRandom, color[][] cellCols){
    super(0, 0, width, height);
    this.detail = detail;
    this.coreRatio = coreRatio;
    this.isCoreRandom = isCoreRandom;
    this.cellCols = cellCols;
    init();
  }

  // constructor
  TTTBoard(float x, float y, float w, float h, int detail,  
  float coreRatio, boolean isCoreRandom, color[][] cellCols){
    super(x, y, w, h);
    this.detail = detail;
    this.coreRatio = coreRatio;
    this.isCoreRandom = isCoreRandom;
    this.cellCols = cellCols;
    init();
  }

  // set critical initialization values
  void init(){
    cellW = w/3;
    cellH = h/3;

    //instantiate individual cell objects
    for (int i=0; i<cells.length; i++){
      float coreW = cellW;
      float coreH = cellH;
      if (isCoreRandom){
        coreW = random(max(cellW*.1, cellW*coreRatio));
        coreH = random(max(cellH*.1, cellH*coreRatio));
      } 
      else {
        coreW *= coreRatio;
        coreH *= coreRatio;
      }
      cells[i] = new Cell(this, 0, 0, cellW, cellH, detail, new Dimension(int(coreW), int(coreH)), cellCols[i], cellPadding, style);
    }

    // map cells to lines
    // rows
    lines[0] = new Line(cells[0], cells[1], cells[2]);
    lines[1] = new Line(cells[3], cells[4], cells[5]);
    lines[2] = new Line(cells[6], cells[7], cells[8]);
    // cols
    lines[3] = new Line(cells[0], cells[3], cells[6]);
    lines[4] = new Line(cells[1], cells[4], cells[7]);
    lines[5] = new Line(cells[2], cells[5], cells[8]);
    // diags
    lines[6] = new Line(cells[0], cells[4], cells[8]);
    lines[7] = new Line(cells[6], cells[4], cells[2]);
    shallowGreen = new ShallowGreen(this);

    // default pattern instantiation
    pattern = new Pattern();
  }

  // ensure cell color initialized if default/minimal constructor used
  void initCellColors(){
    cellCols = new color[cells.length][3];
    // set default colors
    for (int i=0; i<cellCols.length; i++){
      // cell background col
      cellCols[i][0] = 0xff222222;
      // cell shape  col
      cellCols[i][1] = 0xffbbbbbb;
      // cell shape core  col
      cellCols[i][2] = 0xff666666;
    }
  }

  // construct board
  void create(){
    for (int i=0; i<3; i++){
      for (int j=0; j<3; j++){
        // array incrementation variable
        int k = i*3 + j;
        cells[k].x = x + j*cells[k].w;
        cells[k].y = y + i*cells[k].h;
        // indivudual cells manage their own drawing 
        cells[k].create();
      }
    }
    // enable user events
    setEvents();
  }

  // start game move procedure
  void setMove(){
    for (int i=0; i<cells.length; i++){
      if(cells[i].isClicked()){
        if (cells[i].getValue()==0){
          cells[i].setValue(-1);
          if (isWinner() == 0){
            shallowGreen.setNextMove();
          }
        }
      }
    }
  }

  // check for computer and human winner
  int isWinner(){
    for (int i=0; i<lines.length; i++){
      if (lines[i].cells[0].getValue() + 
        lines[i].cells[1].getValue() + 
        lines[i].cells[2].getValue() == -3){
        // highlight players win
        for (int j=0; j<lines[i].cells.length; j++){
          lines[i].cells[j].cellCols[0] = 0xff000000;
          lines[i].cells[j].cellCols[1] = 0xff777777;
          lines[i].cells[j].cellCols[2] = 0xffffffff;
        }
        return -1;
      } 
      else if (lines[i].cells[0].getValue() + 
        lines[i].cells[1].getValue() + 
        lines[i].cells[2].getValue() == 3){
        // highlight ShallowGreen's win
        for (int j=0; j<lines[i].cells.length; j++){
          lines[i].cells[j].cellCols[0] = 0xffffffff;
          lines[i].cells[j].cellCols[1] = 0xff777777;
          lines[i].cells[j].cellCols[2] = 0xff000000;

        }
        return 1;
      }
    }
    return 0;
  }

  // hacked together mouse pressed/released function
  void setEvents(){
    if (mousePressed && isGameOpen){
      if (isMouseEventReady){
        setMove();
        isMouseEventReady = false;
      }
    } 
    else {
      // mouse released stuff here
      if (!isMouseEventReady){
        // check for win here
        if(isWinner() == 1){
          isGameOpen = false;
          println("shallowGreen Won");
        } 
        else if (isWinner() == -1){
          isGameOpen = false;
          println("Player Won");
        } 
        else if (shallowGreen.isDraw()){
          isGameOpen = false;
          println("DRAW\n");
          println("Pattern Created");
          // generate pattern output
          pattern.create();
        }
        isMouseEventReady = true;
      }
    }
  }

  // print matrix of current board values
  void printBoard(){
    for (int i=0; i<lines.length; i++){
      if (i==0){
        println(" rows");
      } 
      else if (i==3){
        println("\n columns");
      } 
      else  if (i==6){
        println("\n Diagonals");
      }
      print("[ ");
      for (int j=0; j<lines[i].cells.length; j++){
        print(lines[i].cells[j].getValue()+"  ");
      }
      print("]\n");
    }
  }

  // setter methods
  // set style of table cells
  void setCellStyle(int detail, float coreRatio, boolean isCoreRandom, color[][] cellCols, float cellPadding, Style style){
    this.detail = detail;
    this.coreRatio = coreRatio;
    this.isCoreRandom = isCoreRandom;
    this.cellCols = cellCols;
    this.cellPadding = cellPadding;
    this.style = style;
    init();
  }

  // overloaded set style of table cells –no Style object parameter
  void setCellStyle(int detail, float coreRatio, boolean isCoreRandom, color[][] cellCols, float cellPadding){
    this.detail = detail;
    this.coreRatio = coreRatio;
    this.isCoreRandom = isCoreRandom;
    this.cellCols = cellCols;
    this.cellPadding = cellPadding;
    init();
  }

  void setPattern(Pattern pattern){
    this.pattern = pattern;
  }

  // controls ShallowGreen's intelligence
  void setIntelligence(int intelligenceSeed){
    this.intelligenceSeed = intelligenceSeed;
  }

  void setLines(Line[] lines){
    this.lines = lines;
  }

}


