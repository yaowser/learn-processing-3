/**
 * Processing color transform
 * using color component functions
 */
size(300, 200);
color col1 = #CC34BB;
fill(col1);
rect(50, 50, 100, 100);
float r = green(col1) - 75;
float g = green(col1) + 130;
float b = blue(col1) - 90;
col1 = color(r, g, b);
fill(col1);
rect(150, 50, 100, 100);

