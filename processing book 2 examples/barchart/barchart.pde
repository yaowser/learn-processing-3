// Sketch5-1
String[] energySource = {"Petroleum", "Coal", "Natural Gas", "Nuclear", "Renewable", "Hydropower"};
float[] consumption = {40.0, 23.0, 22.0, 8.0, 4.0, 3.0};
void setup() {
size(400, 400);
smooth();
} // setup()
void draw() {
// set up plot dimensions relative to screen size
float x = width*0.1;
float y = height*0.9;
float delta = width*0.8/consumption.length;
float w = delta*0.8;
background(255);
for (float value : consumption) {
// draw the bar for value
// first compute the height of the bar
// relative to sketch window
float h = map(value, 0, 100, 0, height);
fill(0);
rect(x, y-h, w, h);
x = x + delta;
}
} // draw()