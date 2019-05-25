import java.util.*;

//Useful globally
PFont font;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
color backgroundGray = color(64, 71, 71);
boolean paused = false;
boolean gameOver = false;

//Key handling
boolean keyLock = false; //for keys not directly affecting the game
boolean aPressed, dPressed, sPressed, jPressed, kPressed = false;
int framesAPressed, framesDPressed, framesSPressed = 0;

Block[][] pField = new Block[20][10];
int curr = (int) random(7); //generates a random piece's index in its non rotated state (for setup)
PShape currPiece, nextPiece;
boolean pieceLocked = false;

PShape b1, b2, b3, b4; //the 4 blocks of a tetromino
float x1, x2, x3, x4, y1, y2, y3, y4; //the corresponding coordinates
float nx1, nx2, nx3, nx4, ny1, ny2, ny3, ny4; //useful for checking bounds
PShape I, O, J, L, S, Z, T;
int rotation = 24;
int maxRotations;
int dx = 0; //distance away from spawn point (top center of screen)
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
float lh = 27.0; //lh = line height
float pFieldWidth = lh * 10;
float pFieldHeight = lh * 20;
float pFieldTopX;
float pFieldTopY;
color black = color(0, 0, 0);

//For the counters
int lines, score, level = 0;

PShape determinePiece(int curr) {
  switch (curr) {
    case 0: return createI(0);
    case 1: return createO(); //square can't rotate so no point
    case 2: return createJ(0);
    case 3: return createL(0);
    case 4: return createS(0);
    case 5: return createZ(0);
    default: return createT(0); //case 6: the T piece
  }
}

//For debugging purposes
String printPFieldColors() {
  String output = "";
  for (int i = 0; i < 20; ++i) {
    for (int j = 0; j < 10; ++j) {
      if (pField[i][j].gColor() == IPieceTurqoise)
        output += "Turq ";

      else if (pField[i][j].gColor() == OPieceYellow) {
        output += "Yell ";
      }

      else if (pField[i][j].gColor() == JPieceBlue) {
        output += "Blue ";
      }

      else if (pField[i][j].gColor() == LPieceOrange) {
        output += "Oran ";
      }

      else if (pField[i][j].gColor() == SPieceGreen) {
        output += "Gree ";
      }

      else if (pField[i][j].gColor() == ZPieceRed) {
        output += "Redd ";
      }

      else if (pField[i][j].gColor() == TPiecePurple) {
        output += "Purp ";
      }

      else
        output += "____ ";
    }

    output += "\n";
  }

  return output;
}

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

void setField() {
  float xB = pFieldWidth/20;
  float yB = pFieldHeight/40;

  //Draw the empty playing field (everything is a block)
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c] = new Block(xB, yB, black);
      xB += pFieldWidth/10;
    }

    xB = pFieldWidth/20;
    yB += pFieldHeight/20;
  }
}

void displayField() {
  //Fill in the empty blocks with their actual values
  pushMatrix();

  translate(pFieldWidth * 1.275, height * 0.190);
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c].display();
    }
  }

  popMatrix();
}

int convertX(float xpos) {
  return (int) ((xpos - 350) / 27);
}

int convertY(float ypos) {
  return (int) ((ypos - 150) / 27);
}

void feedIntoPField() {
  for (int i = 0; i < 20; ++i) { //20 rows
    for (int j = 0; j < 10; ++j) { //10 columns
      if (convertY(ny1) == i && convertX(nx1) == j )
        pField[i][j].cColor(c);

      if (convertY(ny2) == i && convertX(nx2)== j )
        pField[i][j].cColor(c);

      if (convertY(ny3)== i && convertX(nx3)== j )
        pField[i][j].cColor(c);

      if (convertY(ny4)== i && convertX(nx4) == j )
        pField[i][j].cColor(c);
    }
  }
}

void userControls() {
  if (aPressed) ++framesAPressed;
  if (dPressed) ++framesDPressed;
  if (sPressed) ++framesSPressed;

  if (framesAPressed == 1) //if you wish to tap instead of using the auto-shift
    currPiece = moveLeft();

  /*
  The exact mechanics of DAS in NES Tetris:
  - Wait 16 frames after the first initial movement
  - Every subsequent movement takes 6 frames
  */
  else if (framesAPressed == 16) {
    currPiece = moveLeft();
    framesAPressed = 10;
  }

  if (framesDPressed == 1)
    currPiece = moveRight();

  else if (framesDPressed == 16) {
    currPiece = moveRight();
    framesDPressed = 10;
  }

  //forceDown a piece. Go down a line every 2 frames S is held down.
  if (framesSPressed == 2) {
    currPiece = moveDown();
    framesSPressed = 0;
  }
}

void setup() {
  size(960, 720);
  frameRate(60); //believe this is by default but whatever
  background(backgroundGray);
  font = createFont("PressStart2P-Regular.ttf", 28);

  //Assign playing field constants
  pFieldTopY = height * 0.190 + lh/2;
  pFieldTopX = pFieldWidth * 1.275 + lh/2 + 5 * lh;

  currPiece = determinePiece(curr);
  nextPiece = determinePiece(curr);

  setField();
}

void draw() {
  background(backgroundGray); //clear screen
  ++frame; //unless you have the program running a year in a row, this is never overflowing

  //Falling piece
  if (frame % getSpeed() == 0) {
    if (pieceLocked) {
      dx = 0;
      dy = -1;
      currPiece = nextPiece;
      int next = (int) random(7);
      nextPiece = determinePiece(next);
      pieceLocked = false;
    }

    currPiece = moveDown();
    feed();
  }

  userControls();
  displayField();
  lineCounter();
  scoreCounter();
  nextPieceCounter();
  levelCounter();
  //debug();

  shape(currPiece);

  //For debugging purposes: check frames a key has been held down (DAS)
  textFormatting();
  text("A: " + framesAPressed, width - 70, height - 150);
  text("D: " + framesDPressed, width - 70, height - 120);
  text("S: " + framesSPressed, width - 70, height - 90);

  if (gameOver) {
    noLoop();
    gameOverScreen();
  }
}

void keyPressed() {
  switch (key) {
    case (char)10: //pause function - this is the enter key
      if (looping) noLoop();
      else loop();
      break;
    case '-': //proof of concept: decrease level/speed
      if (!keyLock && level > 0) {
        --level;
        keyLock = true;
      }

      break;
    case '=':
      if (!keyLock) {
        ++level;
        keyLock = true;
      }

      break;
    case 'a': //left
      aPressed = true;
      break;
    case 'd': //right
      dPressed = true;
      break;
    case 's': //down
      sPressed = true;
      break;
    case 'j': //rotate counterclockwise
      jPressed = true;
      currPiece = rotateLeft();
      break;
    case 'k': //rotate clockwise
      kPressed = true;
      currPiece = rotateRight();
      break;
  }
}

void keyReleased() {
  switch (key) {
    case '-':
      keyLock = false;
      break;
    case '=':
      keyLock = false;
      break;
    case 'a':
      framesAPressed = 0;
      aPressed = false;
      break;
    case 'd':
      framesDPressed = 0;
      dPressed = false;
      break;
    case 's':
      sPressed = false;
      break;
    case 'j':
      jPressed = false;
      break;
    case 'k':
      kPressed = false;
      break;
  }
}
