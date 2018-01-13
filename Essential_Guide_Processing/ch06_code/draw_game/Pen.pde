/**
 * Draw Game
 * Pen class - delegates drawing to its style object
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class Pen{
  // controls pen's drawing algorithm
  Style style;

  // default constructor
  Pen(){
  }

  // constructor
  Pen(Cell c, Style style){
    this.style = style;
    style.init(c);
  }

  // delegate's drawing to its Style object
  void create(){
    style.create();
  }
}






















