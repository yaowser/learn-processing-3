/**
 * Draw Game
 * Line class - organizes cells
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Line{

  // reference to its internal cells
  Cell[] cells = new Cell[3];

  // default constructor
  Line(){
    init();
  }

  // constructor
  Line(Cell c1, Cell c2, Cell c3){
    cells[0] = c1;
    cells[1] = c2;
    cells[2] = c3;
  }

  // used by default constructor
  void init(){
    for (int i=0; i<cells.length; i++){
      cells[i] = new Cell();
    }
  }

  // used by AI for assessing strategic position
  boolean isOnlyPlayer(){
    // ensure no shallowGreen marks
    for (int i=0; i<3; i++){
      if (cells[i].getValue() == 1){
        return false;
      }
    }
    // if only 1 human player mark in line return true
    if (cells[0].getValue() + cells[1].getValue() + cells[2].getValue() == -1){
      return true;
    }
    return false;
  }

  // returns true if no human player marks in line yet
  boolean isVirgin() {
    boolean isSafe = true;
    for (int i=0; i<cells.length; i++){
      if (cells[i].getValue() == -1){
        isSafe =  false;
      }
    }
    return isSafe;
  }

  // setter/getter
  void setCells(Cell c1, Cell c2, Cell c3){
    cells[0] = c1;
    cells[1] = c2;
    cells[2] = c3;
  }

  Cell[] getCells(){
    return cells;
  }

}




