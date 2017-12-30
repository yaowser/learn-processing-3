// Sketch5-4: Bar Graph using a barGraph() function with array parameter
String[] energySource = {"Petroleum", "Coal", "Natural Gas", "Nuclear", "Renewable", "Hydropower"};
float[] consumption = {40.0, 23.0, 22.0, 8.0, 4.0, 3.0};
void setup() {
size(400, 400);
smooth();
} // setup()
void draw() {
background(255);
barGraph(consumption);
} // draw()
void barGraph(float[] data) {
// set up plot dimensions relative to screen size
float x = width*0.1;
float y = height*0.9;
float delta = width*0.8/data.length;
float w = delta*0.8;
for (float i : data) {
// draw the bar for ith data value
// first compute the height of the bar relative to sketch window
float h = map(i, 0, 100, 0, height);
fill(0);
rect(x, y-h, w, h);
x = x + delta;
}
} // barGraph()