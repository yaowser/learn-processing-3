
//----------------------------------------------------------------------//
//           Functions for Traffic Vehicles & Shrubbery                 //
//----------------------------------------------------------------------//

void trafficSemiTruck (float x, float y, float r, float g, float b) {
  noStroke();
  fill(r, g, b);
  rect(x-28, y-127, 55, 92);//car body
  fill(0);
  stroke(r, g, b);
  strokeWeight(2);
  rect(x-24, y-89, 47, 41);//windows
  noStroke();
  fill(r-70, g-70, b-70); 
  rect(x-25, y-62, 50, 30);
  fill(r-100, g-120, b-120);

  rect(x-30, y-59, 59, 185);//trailer of truck
  noStroke();
  fill(r, g, b);
  rect(x-18, y-82, 36, 20);//roof top
  stroke(r, g, b);
  strokeWeight(3);
  strokeCap(ROUND);
  line(x-23, y-88, x-18, y-82);
  line(x-23, y-64, x-16, y-64);
  //line(x-24, y+24, x-18, y+18);
  line(x+17, y-82, x+22, y-88);
  line(x+23, y-64, x-16, y-64);
  //line(x+17, y+19, x+22, y+24);
}

void trafficCar (float x, float y, float r, float g, float b) {
  noStroke();
  fill(r, g, b);
  rect(x-25, y-47, 50, 90);//car body
  fill(0);
  stroke(r, g, b);
  strokeWeight(2);
  rect(x-24, y-22, 47, 47);//windows
  noStroke();
  fill(r, g, b);
  rect(x-18, y-15, 36, 34);//roof top
  stroke(r, g, b);
  strokeWeight(3);
  strokeCap(ROUND);
  line(x-23, y-21, x-18, y-15);
  line(x-23, y+3, x-16, y+3);
  line(x-24, y+24, x-18, y+18);
  line(x+17, y-15, x+22, y-21);
  line(x+23, y+3, x-16, y+3);
  line(x+17, y+19, x+22, y+24);
}

void trafficTruck (float x, float y, float r, float g, float b) {
  noStroke();
  fill(r, g, b);
  rect(x-25, y-57, 50, 135);//car body
  fill(0);
  stroke(r, g, b);
  strokeWeight(2);
  rect(x-24, y-22, 47, 28);//windows 
  fill(r-80, b-80, g-80);
  noStroke();
  rect(x-22, y+6, 44, 69);//bed of truck
  noStroke();
  fill(r, g, b);
  rect(x-18, y-15, 36, 20);//roof top
  stroke(r, g, b);
  strokeWeight(3);
  strokeCap(ROUND);
  line(x-23, y-21, x-18, y-15);
  line(x-23, y+3, x-16, y+3);
  //line(x-24, y+24, x-18, y+18);
  line(x+17, y-15, x+22, y-21);
  line(x+23, y+3, x-16, y+3);
  //line(x+17, y+19, x+22, y+24);
}


void tree (float treeX, float treeY) {
  noStroke();
  fill(#0D900E);
  ellipse(treeX, treeY, 50, 50);
  ellipse(treeX - 15, treeY - 10, 45, 30);
  ellipse(treeX + 15, treeY - 10, 55, 40);
  ellipse(treeX + 20, treeY + 20, 55, 60);
  ellipse(treeX - 15, treeY + 20, 75, 60);
  ellipse(treeX - 10, treeY + 20, 50, 80);
}
