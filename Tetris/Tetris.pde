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
float lineHeight = 27.0;
float pFieldWidth = lineHeight * 10;
float pFieldHeight = lineHeight * 20;
float pFieldLeftX;
float pFieldTopY;

//For the counters
int level, lines, score = 0;
int speed; //not shown on-screen but calculated from the level via a switch statement

Block[][] pField = new Block[20][10];
float pieceY;

/*
Piece[] pieces = new Piece[7]; //seven diff type of pieces
Piece nextP;
Piece chooseN() {
  int index = (int) random(7);
  return pieces[index];
}
*/

void setup() {
  size(960, 720);
  frameRate(60); //believe this is by default but whatever
  background(backgroundGray);
  font = createFont("PressStart2P-Regular.ttf", 28);

  //Assign playing field constants
  pFieldLeftX = pFieldWidth * 1.275; //this is the x location, just felt a need to differentiate from pFieldWidth which is the size
  pFieldTopY = height * 0.190;
  pieceY = pFieldTopY;
  createPieces(); //Assign Pieces.pde shapes

  /* This isn't needed - Kevin
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
  */
}

void draw() {
  background(backgroundGray); //clear screen

  //Those are just to show counter updating works
  ++frame; //unless you have the program running a year in a row, this is never overflowing
  ++lines;
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
  translate(pFieldWidth * 1.275, height * 0.190);
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c].display();
    }
  }
  popMatrix();

  frameCounter();
  lineCounter();
  scoreCounter();

  //Falling piece
  shape(LPiece, pFieldLeftX + lineHeight * 4, pieceY);
  if (frame % 48 == 0) {
    pieceY += lineHeight;
  }
}
