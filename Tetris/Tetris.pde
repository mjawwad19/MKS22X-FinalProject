PFont font28; //NES font

class Block {
  int x;
  int y;
  color c;
  
  Block(int posX, int posY, int r, int g, int b) {
    x = posX;
    y = posY;
    c = color(r, g, b);
    rectMode(CENTER);
    fill(c);
    rect(x, y, 10, 10);
  }
}

void setup() {
  size(960, 720);
  frameRate(60);
  background(64, 71, 71); //gray
  font28 = createFont("PressStart2P-Regular.ttf", 28);
  
  //Playing field
  fill(0);
  rectMode(CENTER);
  stroke(255); //black borders
  strokeWeight(2);
  rect(width / 2, height * 0.55, width/3, height * 0.75); //looks closest to the actual game, by my eye
  
  //Lines box
  rect(width/2, height * 0.1, width/3, height * 0.1); //magic numbers galore!
  
  //Score box 
  rect(width * (13.3/16), height * 0.2, width/5, width/6);
  textFont(font28);
  textAlign(CENTER, CENTER);
  fill(255);
  text("SCORE", width * (13.3/16), height * 0.16);
}

void draw() {
  
}
