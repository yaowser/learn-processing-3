/**
 * Draw Game
 * ShallowGreen class:  tic-tac-toe ai class
 * By Ira Greenberg <br />
 * The Essential Guide to Processing for Flash Developers,
 * Friends of ED, 2009
 */

class ShallowGreen{

  // instance properties
  TTTBoard board;
  int moves;
  boolean isActive = true;

  // default constructor
  ShallowGreen(){
  }

  // constructor
  ShallowGreen(TTTBoard board){
    this.board = board;
  }

  // return true if game is a draw
  boolean isDraw(){
    for (int i=0; i<board.cells.length; i++){
      if (board.cells[i].getValue()==0){
        return false;
      }
    }
    return true;
  }

  /* rules:
   1. Try to win
   2. Try to block
   3. Take a strategic position
   4. Take best remaining position
   5. Take any remaining position
   */
  void setNextMove(){
    // keep track of number of moves
    moves++;
    int shallowGreen = 0;
    int player = 0;
    int intelligence = 0;
    if (board.intelligenceSeed > 4){
      intelligence = 2;
    } 
    else {
      intelligence = round(random(board.intelligenceSeed));
    }

    // flag that controls evaluation flow
    isActive = true;

    if (intelligence > 1){
      win();
      block();
      moveRandom();
    } 
    else {
      moveRandom();
    }
  }

  // Try to WIN
  void win(){
    int shallowGreen = 0;
    int player = 0;
    for (int i=0; i<board.lines.length; i++){
      if (isActive){
        // reset tally
        shallowGreen = 0;
        player = 0;
        // tally each line
        for (int j=0; j<board.lines[i].cells.length; j++){
          if (board.lines[i].cells[j].getValue() == 1){
            shallowGreen += 1;
          } 
          else if (board.lines[i].cells[j].getValue() == -1){
            player += 1;
          }
        }
        // 1. Try to WIN
        // line has 2 o's and no x's
        if (shallowGreen == 2 && player == 0){
          // set line to all o's
          for (int j=0; j<board.lines[i].cells.length; j++){
            board.lines[i].cells[j].setValue(1);
          }
          isActive = false;
        }  
      }
    }
  }

  // block player win or strategic position
  void block(){
    // 2. Try to BLOCK win
    for (int i=0; i<board.lines.length; i++){
      if (isActive){
        // reset tally
        int shallowGreen = 0;
        int player = 0;
        // tally each line
        for (int j=0; j<board.lines[i].cells.length; j++){
          if (board.lines[i].cells[j].getValue() == 1){
            shallowGreen += 1;
          } 
          else if (board.lines[i].cells[j].getValue() == -1){
            player += 1;
          }
        }
        // Block win
        if (player == 2 && shallowGreen == 0){
          isActive = false;
          for (int j=0; j<board.lines[i].cells.length; j++){
            if (board.lines[i].cells[j].getValue() == 0){
              board.lines[i].cells[j].setValue(1);
            }
          }
        }
      } 
    }

    // 2. BLOCK traps
    // check diagonal traps
    // take non-corner
    /*
     |O| | |    | | |O|
     | |X| | or | |X| |
     | | |O|    |O| | |
     */
    if (isActive && moves == 2){
      if (board.lines[0].cells[0].getValue() == -1 &&
        board.lines[2].cells[2].getValue() == -1 ||
        board.lines[2].cells[0].getValue() == -1 &&
        board.lines[0].cells[2].getValue() == -1){
        board.lines[1].cells[0].setValue(1);
        isActive = false;
      }
    }
    // check more diagonal traps
    // take blocked corner
    /*
     |O| | |
     | |X| | or similar variations
     | |O| | 
     */
    if (isActive && board.lines[0].cells[0].getValue() == 0){
      if (board.lines[0].isOnlyPlayer() && board.lines[3].isOnlyPlayer()){
        board.lines[0].cells[0].setValue(1);
        isActive = false;
      }
    }
    if (isActive && board.lines[0].cells[2].getValue() == 0){
      if (board.lines[0].isOnlyPlayer() && board.lines[5].isOnlyPlayer()){
        board.lines[0].cells[2].setValue(1);
        isActive = false;
      }
    }
    if (isActive && board.lines[2].cells[0].getValue() == 0){
      if (board.lines[2].isOnlyPlayer() && board.lines[3].isOnlyPlayer()){
        board.lines[2].cells[0].setValue(1);
        isActive = false;
      }
    }
    if (isActive && board.lines[2].cells[2].getValue() == 0){
      if (board.lines[2].isOnlyPlayer() && board.lines[5].isOnlyPlayer()){
        board.lines[2].cells[2].setValue(1);
        isActive = false;
      }
    }

    // check diagonal traps 2
    // take available corner
    /*
     |X| | |    | | |X|
     | |O| | or | |O| |
     | | |O|    |O| | |
     */
    if (isActive && moves == 2){
      if (board.lines[1].cells[1].getValue() == -1 && board.lines[2].cells[2].getValue() == -1 ||
        board.lines[0].cells[0].getValue() == -1 && board.lines[1].cells[1].getValue() == -1){
        board.lines[2].cells[0].setValue(1);
        isActive = false;
      }
    }
    if (isActive && moves == 2){
      if (board.lines[2].cells[0].getValue() == -1 && board.lines[1].cells[1].getValue() == -1 ||
        board.lines[0].cells[2].getValue() == -1 && board.lines[1].cells[1].getValue() == -1){
        board.lines[0].cells[0].setValue(1);
        isActive = false;
      }
    }

    // 3. check for center square
    if (board.lines[1].cells[1].getValue() == 0 && isActive){
      board.lines[1].cells[1].setValue(1);
      isActive = false;
    }

    // 4. take best remaininge
    // check for line with win potential(free of human player mark)
    for (int i=0; i<board.lines.length; i++){
      if (board.lines[i].isVirgin() && isActive){
        for (int j=0; j<board.lines[i].cells.length; j++){
          if (board.lines[i].cells[j].getValue() == 0 && isActive){
            board.lines[i].cells[j].setValue(1);
            isActive = false;
          }
        }
      }
    }
  }

  // 5. place mark randomly in any available cell
  void moveRandom(){
    int[] shuffledCells = getShuffled();
    for (int i=0; i<board.cells.length; i++){
      if (board.cells[shuffledCells[i]].getValue() == 0 && isActive){
        board.cells[shuffledCells[i]].setValue(1);
        isActive = false;  
      }
    }
  }

  // shuffles cell array to avoid predictable moves
  int[] getShuffled(){
    // local shuffled array
    int[] shuffledArr = {
    };
    while(shuffledArr.length<board.cells.length){
      int val = floor(random(board.cells.length));
      //  pass random value to helper method
      if (isUnique(val, shuffledArr)){
        shuffledArr = append(shuffledArr, val);
      }
    }
    return shuffledArr;
  }

  // helper method for getShuffled() method
  boolean isUnique(int val, int[] arr){
    for (int i=0; i<arr.length; i++){
      if (arr[i] == val){
        return false;
      }
    }
    return true; 
  }

}



