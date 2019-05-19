//Useful globally
PFont font;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
float lineHeight; //useful constant possibly

//For the counters
int level, lines = 0, score = 0;
int speed; //not shown on-screen but calculated from the level via a switch statement

//Piece colors
color IPieceTurqoise = color(0, 255, 255);
color OPieceYellow = color(255, 255, 0);
color JPieceBlue = color(0, 0, 204);
color LPieceOrange = color(255, 153, 0);
color SPieceGreen = color(0, 255, 0);
color ZPieceRed = color(255, 0, 0);
color TPiecePurple = color(204, 51, 255);

float pFieldWidth, pFieldHeight;
Block[][] pField = new Block[20][10];
/*Piece[] pieces = new Piece[7]; //seven diff type of pieces
Piece nextP;
Piece chooseN() {
  int index = (int) random(7);
  return pieces[index];
}*/

void setup() {
  size(960, 720);
  frameRate(60);
  background(64, 71, 71); //gray
  font = createFont("PressStart2P-Regular.ttf", 28);

  //Playing field
  pFieldWidth = width * 0.33;
  pFieldHeight = height * 0.75;
  lineHeight = pFieldHeight/20;
  fill(0);
  rectMode(CENTER);
  stroke(255); //black borders
  strokeWeight(2);
  rect(width * 0.50, height * 0.55, pFieldWidth, pFieldHeight); //looks closest to the actual game, by my eye
  //pushMatrix();
  //translate(width * .5, height * .55);
  float xB = pFieldWidth/20;
  float yB = pFieldHeight/40;
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c] = new Block(xB, yB, 0, 0, 0);
      xB += pFieldWidth/10;
    }
    xB = pFieldWidth/20;
    yB += pFieldHeight/20;
  }
  //popMatrix();
  //Lines box
  rect(width * 0.50, height * 0.10, pFieldWidth, height * 0.10); //magic numbers galore!

  //Score box
  rect(width * 0.83, height * 0.20, width * 0.20, width * 0.16);
  textFormatting();
  text("SCORE", width * 0.83, height * 0.16);

  createPieces();
  shape(IPiece, width * 0.20, height * 0.00);
  shape(OPiece, width * 0.20, height * 0.20);
  shape(JPiece, width * 0.20, height * 0.30);
  shape(LPiece, width * 0.20, height * 0.40);
  shape(SPiece, width * 0.20, height * 0.50);
  shape(ZPiece, width * 0.20, height * 0.60);
  shape(LPiece, width * 0.20, height * 0.70);
}

void draw() {
  ++frame; //unless you have the program running a year in a row, this is never overflowing
  ++lines; //those 2 are just to show the numbers changing
  ++score;
  pushMatrix();
  translate(pFieldWidth * 1.015, height * .175);
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c].display();
    }
  }
  popMatrix();
  frameCounter();
  lineCounter();
  scoreCounter();
}
