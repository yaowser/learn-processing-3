/*
Neighborhood
Ira Greenberg, January 1, 2006
Happy New Year!
*/
void setup(){
size(600, 400);
background(190);
smooth();
//ground plane
int groundHeight = 10;
fill(0);
rect(0, height-groundHeight, width, groundHeight);
fill(255);
// Houses
Door door1 = new Door(40, 80);
Window window1 = new Window(100, 125, false, Window.DOUBLE);
Roof roof1 = new Roof(Roof.DOME);
House house1 = new House(150, 150, door1, window1, roof1, 
House.MIDDLE_DOOR);
house1.drawHouse(50, height-groundHeight-house1.h, true);
Door door2 = new Door(40, 80);
Window window2 = new Window(100, 125, true, Window.QUAD);
Roof roof2 = new Roof(Roof.GAMBREL);
House house2 = new House(200, 120, door2, window2, roof2, 
House.LEFT_DOOR);
house2.drawHouse(50+house1.w, height-groundHeight-house2.h, true);
Door door3 = new Door(40, 80);
door3.setKnob(Door.RT);
Window window3 = new Window(125, 125, true, Window.SINGLE);
Roof roof3 = new Roof(Roof.CATHEDRAL);
House house3 = new House(150, 200, door3, window3, roof3, 
House.RIGHT_DOOR);
house3.drawHouse(house2.x+house2.w, height-groundHeight-house3.h, 
true);
}
// add Door class
// add Window class
// add Roof class
// add House class