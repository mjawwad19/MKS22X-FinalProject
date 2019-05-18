//Useful globally
PFont font;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
int lineHeight; //useful constant possibly

//For the counters
int level, lines = 0, score = 0;
int speed; //not shown on-screen but calculated from the level via a switch statement

float pFieldWidth, pFieldHeight;

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
  font = createFont("PressStart2P-Regular.ttf", 28);
  
  //Playing field
  pFieldWidth = width * 0.33;
  pFieldHeight = height * 0.75;
  fill(0);
  rectMode(CENTER);
  stroke(255); //black borders
  strokeWeight(2);
  rect(width * 0.50, height * 0.55, pFieldWidth, pFieldHeight); //looks closest to the actual game, by my eye
  
  //Lines box
  rect(width * 0.50, height * 0.10, pFieldWidth, height * 0.10); //magic numbers galore!
  
  //Score box 
  rect(width * 0.83, height * 0.20, width * 0.20, width * 0.16);
  textFormatting();
  text("SCORE", width * 0.83, height * 0.16);
}

void draw() {
  ++frame; //unless you have the program running a year in a row, this is never overflowing
  ++lines; //those 2 are just to show the numbers changing
  ++score;
  
  frameCounter();
  lineCounter();
  scoreCounter();
}
