/**
 * Draw Game
 * Main Tab
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

TTTBoard board;

void setup(){
  size(400, 400);
  background(255, 0, 0);
  smooth();
  board = new TTTBoard(0, 0, width-1, height-1);


  // randomly assign board colors
  color[][] cellCols = new color[9][3];

  // random RGB 
  for (int i=0;i<9; i++){
    for (int j=0;j<3; j++){
      if (j==0){
        cellCols[i][j] =  color(255);
      } 
      else {
        cellCols[i][j] =  color(random(255), random(255), random(255));
      }

    }
  }

  // set optional styles (drawing algorithms)
  Style style = new IraStyle();
  // set board style values
  board.setCellStyle(2, .85, false, cellCols, 0, style);

  // set pattern values
  Pattern pattern = new Pattern(3, 3, .5, .5);
  board.setPattern(pattern);

  board.setIntelligence(5);

}

void draw(){
  board.create();
  // prints board values
  board.printBoard();
}







