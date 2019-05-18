//Useful globally
PFont font28; //NES font, size 28
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
final int lineHeight = height / 20; //useful constant possibly

//For the counters
int level, lines = 0, score = 0;
int speed; //not shown on-screen but calculated from the level via a switch statement

float pFieldWidth = width * 0.33;
float pFieldHeight = height * 0.75;

Block[][] pField = new Block[20][10];

class Block {
  float x,y;
  color c;
  
  Block(float posX, float posY, int r, int g, int b) {
    x = posX;
    y = posY;
    c = color(r, g, b);
  }
  
  void display() {
    rectMode(CENTER);
    fill(c);
    stroke(255); //border
    rect(x, y, pFieldWidth/10, pFieldHeight/20);
  }
}

void setup() {
  System.out.println(width);
  System.out.println(pFieldWidth);
  System.out.println(pFieldHeight);
  size(960, 720);
  frameRate(60);
  background(64, 71, 71); //gray
  font28 = createFont("PressStart2P-Regular.ttf", 28);
  
  //Playing field
  fill(0);
  rectMode(CENTER);
  stroke(255); //black borders
  strokeWeight(2);
  rect(width * 0.50, height * 0.55, pFieldWidth, pFieldHeight); //looks closest to the actual game, by my eye
  float xB = pFieldWidth/20;
  float yB = pFieldHeight/40;
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c] = new Block(xB, yB, 255, 0, 0);
      xB += pFieldWidth/10;
      yB += pFieldHeight/20;
    }
  }
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
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c].display();
    }
  }
  frameCounter();
  lineCounter();
  scoreCounter();
}
