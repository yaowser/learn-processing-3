/**
 * Draw Game
 * Cell class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Cell extends Shape{
  /* value associated with the cell
   based on what is in the cell: 
   empty=0, human mark=-1, computer mark=1 */
  int val;
  /* the level of detail in the curvilinear (human) 
   and linear(computer) marks */
  int detail;
  /* controls the space between the mark 
   and the edges of the cell */
  float padding;
  //controls Pen's drawing algorithm
  Style style;
  /* Java's Dimension class
   -includes public width and height properties */
  Dimension coreSize;
  /*Reference to color array of length 3
   cellCols[0] = cell background
   cellCols[1] = cell main mark color
   cellCols[2] = cell mark core color */
  color[] cellCols;
  // composed helper class delegates drawing
  Pen pen;
  // reference to main organizing class
  TTTBoard board;

  // default constructor
  Cell(){
    init();
  }
  // constructor
  Cell(TTTBoard board, float x, float y, float w, float h,int detail, Dimension coreSize, color[] cellCols, float cellPadding, Style style){
    super(x, y, w, h);
    this.board = board;
    this.detail = detail;
    this.coreSize = coreSize;
    this.cellCols = cellCols;
    padding = cellPadding;
    // returns copy of style argument
    this.style = style.getClone();
    init();
  }

  // ensure pen is instantiated
  void init(){
    pen = new Pen(this, style);
  }

  // draw the cells
  void create(){
    fill(cellCols[0]);
    stroke(100);
    // hide cell outlines before pattern is created
    if (board.shallowGreen.isDraw()){
      noStroke();
    }
    // draw cell background
    rect(x, y, w, h);
    // draw cell contents
    pen.create();
  }

  // detect mouse click on cell
  boolean isClicked(){
    return (mouseX > x && mouseX < x+w && mouseY>y && mouseY < y+h);
  }

  // setter/getter
  void setValue(int val){
    this.val = val;
  }

  int getValue(){
    return val;
  }
}











