// Ex11_01

color[] rainbow = {#FFFFCD, #CC5C54, #F69162, #85A562, #7AB5DB};
color[] palette = rainbow;
PFont labelFont;

Table stateData;
int rowCount;
int d = 10;

void setup() {
  size(600, 200);
  stateData = new Table("stateData.tsv");
  rowCount = stateData.getRowCount();
  println("rowCount = " + rowCount);
  labelFont = loadFont("GillSans-Bold-18.vlw");
}

void draw() {
  background(palette[0]);
  textFont(labelFont);
  stroke(180);
  fill(180);
  textAlign(CENTER);

for (int i = 0; i < 8; i++) {
  line(i * 80 + 100, 20, i * 80 + 100, height - 30);
  text (i-2, i * 80 + 100, height - 10);
}

  smooth();
  noStroke();

  for (int row = 0; row < rowCount; row++) {
    // State names
    String state = stateData.getString(row, 0);
    
    // NFL
    float nfl = (stateData.getFloat(row,  9) + 2) * 65 + 100;
    fill(palette[1], 160);
    ellipse(nfl, height*.2, d, d);
    text("nfl", 60, height*.2+5);
    if(dist(nfl, height*.2, mouseX, mouseY) < (d/2+1)) {
      text(state, nfl, height*.2 - 10);
    }

    // NBA
    float nba = (stateData.getFloat(row, 10) + 2) * 65 + 100;
    fill(palette[2], 160);
    ellipse(nba, height*.4, d, d);
    text("nba", 60, height*.4+5);
    if(dist(nba, height*.4, mouseX, mouseY) < (d/2+1)) {
      text(state, nba, height*.4 - 10);
    }

    // MLB
    float mlb = (stateData.getFloat(row, 11) + 2) * 65 + 100;
    fill(palette[3], 160);
    ellipse(mlb, height*.6, d, d);
    text("mlb", 60, height*.6+5);
    if(dist(mlb, height*.6, mouseX, mouseY) < (d/2+1)) {
      text(state, mlb, height*.6 - 10);
    }

    // MLS
    float mls = (stateData.getFloat(row, 12) + 2) * 65 + 100;
    fill(palette[4], 160);
    ellipse(mls, height*.8, d, d);
    text("mls", 60, height*.8+5);
    if(dist(mls, height*.8, mouseX, mouseY) < (d/2+1)) {
      text(state, mls, height*.8 - 10);
    }
  }
}