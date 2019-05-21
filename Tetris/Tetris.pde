//Useful globally
PFont font;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
color backgroundGray = color(64, 71, 71);
boolean keyLock = false;

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

//Returns how many frames it takes a piece to fall down 1 line (e.g. 48 on level 0)
int getSpeed() {
  switch (level) {
    case 0:
      return 48;
    case 1:
      return 43;
    case 2:
      return 38;
    case 3:
      return 33;
    case 4:
      return 28;
    case 5:
      return 23;
    case 6:
      return 18;
    case 7:
      return 13;
    case 8:
      return 8;
    case 9:
      return 6;
    case 10:
      return 5;
    case 11:
      return 5;
    case 12:
      return 5;
    case 13:
      return 4;
    case 14:
      return 4;
    case 15:
      return 4;
    case 16:
      return 3;
    case 17:
      return 3;
    case 18:
      return 3;
    case 19:
      return 2;
    case 20:
      return 2;
    case 21:
      return 2;
    case 22:
      return 2;
    case 23:
      return 2;
    case 24:
      return 2;
    case 25:
      return 2;
    case 26:
      return 2;
    case 27:
      return 2;
    case 28:
      return 2;
    default: //Level 29 and above: the kill screen
      return 1;
  }
}

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
  levelCounter();

  //Falling piece
  shape(LPiece, pFieldLeftX + lineHeight * 4, pieceY);
  if (frame % getSpeed() == 0) {
    pieceY += lineHeight;
  }
}

void keyPressed() {
  if (!keyLock) {
    if (key == '-') {
      if (level > 0)
        --level;

      keyLock = true;
    }

    if (key == '=') {
      ++level;
      keyLock = true;
    }
  }
}

  void keyReleased() {
    keyLock = false;
  }
