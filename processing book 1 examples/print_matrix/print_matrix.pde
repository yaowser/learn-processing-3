// printMatrix()
//initial state
println(" before transformations");
printMatrix();
//translate
translate(150, 225);
println(" after translate()");
printMatrix();
//scale
scale(.75, .95);
println(" after translate() and scale()");
printMatrix();
//rotate
rotate(PI*.3);
println(" after translate(), scale() and rotate()");
printMatrix();
//reset
resetMatrix();
println(" after resetMatrix()");
printMatrix();