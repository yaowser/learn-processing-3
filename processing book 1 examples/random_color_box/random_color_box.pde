void setup(){
size(400, 400);
background(255);
noStroke();
float myColor = getRandomColor();
fill(myColor);
rect(width/4, height/4, width/2, height/2);
}
float getRandomColor(){
return random(255);
}