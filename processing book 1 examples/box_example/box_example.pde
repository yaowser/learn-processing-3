//Example 1:
noStroke();
rect(10, 10, 25, 25);
printMatrix();
pushMatrix();
translate(20, 20);
scale (1.5);
rect(10, 10, 25, 25);
printMatrix();
popMatrix();
pushMatrix();
translate(70, 70);
scale (.5);
rect(10, 10, 25, 25);
printMatrix();
popMatrix();
printMatrix();