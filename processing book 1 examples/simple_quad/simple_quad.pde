// Simple Quad
size(300, 300);
background(0);
noStroke();
smooth();
// quad(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y)
quad(50+random(-25, 25), 50+random(-25, 25), 
250+random(-25, 25), 50+random(-25, 25), 
250+random(-25, 25), 250+random(-25, 25), 
50+random(-25, 25), 250+random(-25, 25));