class House {
  Door door;
  Door[] doors;
  Staircase stairs;
  Window[] windows;
  
  House () {
    door = new Door();
    stairs = new Staircase();
  }
  
  House(Door door, Door[] doors, Staircase stairs, Window[] windows) {
    this.doors = doors;
    this.stairs = stairs;
    this.windows = windows;
  }
  void construct () {
   doors[i].construct();
   stairs.construct();
  }
  
  
}