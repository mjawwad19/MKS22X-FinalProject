//Useful globally
PFont font;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
color backgroundGray = color(64, 71, 71);

//Piece colors
color IPieceTurqoise = color(0, 255, 255);
color OPieceYellow = color(255, 255, 0);
color JPieceBlue = color(0, 0, 204);
color LPieceOrange = color(255, 153, 0);
color SPieceGreen = color(0, 255, 0);
color ZPieceRed = color(255, 0, 0);
color TPiecePurple = color(204, 51, 255);

//Constants
float pFieldWidth, pFieldHeight;
float lineHeight;

//For the counters
int level, lines, score = 0;
int speed; //not shown on-screen but calculated from the level via a switch statement

Block[][] pField = new Block[20][10];
float pieceY = height * 0.10; //random number for now just for testing

/*
Piece[] pieces = new Piece[7]; //seven diff type of pieces
Piece nextP;
Piece chooseN() {
  int index = (int) random(7);
  return pieces[index];
}
*/

//Seems like this isn't even used
void playingFieldBox() {
  fill(0);
  rectMode(CENTER);
  stroke(255); //black borders
  strokeWeight(2);
  rect(width * 0.50, height * 0.55, pFieldWidth, pFieldHeight); //looks closest to the actual game, by my eye
}

void setup() {
  size(960, 720);
  frameRate(60); //believe this is by default but whatever
  background(backgroundGray);
  font = createFont("PressStart2P-Regular.ttf", 28);

  //Assign playing field constants
  pFieldWidth = width * 0.33;
  pFieldHeight = height * 0.75;
  lineHeight = pFieldHeight/20;

  createPieces(); //Assign Pieces.pde shapes

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
}

void draw() {
  background(64, 71, 71); //clear screen

  ++frame; //unless you have the program running a year in a row, this is never overflowing
  ++lines; //those 2 are just to show the numbers changing
  ++score;

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

  //Playing field
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

  shape(LPiece, width * 0.20, pieceY);
  if (frame % 48 == 0) {
    pieceY += lineHeight;
  }
}
