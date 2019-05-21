//Useful globally
PFont font;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
color backgroundGray = color(64, 71, 71);
PShape b1, b2, b3, b4;
float x1, x2, x3, x4, y1, y2, y3, y4;
float nx1, nx2, nx3, nx4, ny1, ny2, ny3, ny4; //useful for checking bounds
PShape I, O, J, L, S, Z, T;
int rotation = 0;
int maxRotations;
int dx = 0;
int dy = 0;
//Piece colors
color IPieceTurqoise = color(0, 255, 255);
color OPieceYellow = color(255, 255, 0);
color JPieceBlue = color(0, 0, 204);
color LPieceOrange = color(255, 153, 0);
color SPieceGreen = color(0, 255, 0);
color ZPieceRed = color(255, 0, 0);
color TPiecePurple = color(204, 51, 255);

//Constants
float lh = 27.0;
float pFieldWidth = lh * 10;
float pFieldHeight = lh * 20;
float pFieldTopX;
float pFieldTopY;

//For the counters
int level, lines, score = 0;
int speed; //not shown on-screen but calculated from the level via a switch statement


Block[][] pField = new Block[20][10];
float pieceY;


int curr = (int) random(7);
PShape currPiece, nextPiece;
PShape determine() {
  if (curr == 0) return createI(0);
  else if (curr == 1) return createO(); //squars 
  else if (curr == 2) return createJ(0);
  else if (curr == 3) return createL(0);
  else if (curr == 4) return createS();
  else if (curr == 5) return createZ();
  else return createT();
}

void setup() {
  size(960, 720);
  frameRate(60); //believe this is by default but whatever
  background(backgroundGray);
  font = createFont("PressStart2P-Regular.ttf", 28);

  //Assign playing field constants
  pFieldTopY = height * 0.190 + lh/2; 
  pFieldTopX = pFieldWidth * 1.275 + lh/2 +5 *lh;
  currPiece = determine();
  nextPiece = determine();
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
   shape(currPiece);
  if (frame % 20 == 0) {
    //currPiece = moveDown();
  }
  /*if (keyPressed) {
      if (key == 'a')currPiece = rotateLeft();
      if (key == 'd')currPiece = rotateRight();
      if (key == 'z') currPiece = moveLeft();
      if (key =='x') currPiece = moveRight();
    }*/
}
