import java.util.*;

//Useful globally
PFont font;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
color backgroundGray = color(64, 71, 71);
color black = color(0, 0, 0);
color white = color(255, 255, 255);

//Piece colors
color IPieceTurqoise = color(0, 255, 255);
color OPieceYellow = color(255, 255, 0);
color JPieceBlue = color(0, 0, 204);
color LPieceOrange = color(255, 153, 0);
color SPieceGreen = color(0, 255, 0);
color ZPieceRed = color(255, 0, 0);
color TPiecePurple = color(204, 51, 255);

//Key handling
boolean keyLock = false; //for keys that shouldn't be held down
boolean aPressed, dPressed, sPressed = false;
int framesAPressed, framesDPressed, framesSPressed = 0; //for implementing the DAS mechanic
boolean paused = false;

//For the playing field
Block[][] pField = new Block[20][10];
PShape currPiece;
int curr = (int) random(7); //indices for the pieces to generate
int next = (int) random(7);
boolean pieceLocked = false;
int framesPieceLocked = 0;

PShape b1, b2, b3, b4; //the 4 blocks of a tetromino
float x1, x2, x3, x4, y1, y2, y3, y4; //the corresponding coordinates
float nx1, nx2, nx3, nx4, ny1, ny2, ny3, ny4; //useful for checking bounds
PShape I, O, J, L, S, Z, T;
int rotation = 0; //hmm the rotation bug seems to be gone, setting it back to 0 for now
int maxRotations;
int dx = 0; //distance away from spawn point (top center of screen)
int dy = 0;

//Useful constants
float lh = 27.0; //lh = line height
float pFieldWidth = lh * 10;
float pFieldHeight = lh * 20;
float pFieldTopX; //have to assign those two later in setup
float pFieldTopY;

//For the counters
int lines, score, level = 0;

//To deal with the end of the game
boolean gameOver = false;
color[] barColors = {ZPieceRed, white, JPieceBlue};
int framesAfterLoss = 0;
int colorIdx = 0;
float yPos = pFieldTopY + 140;

PShape determinePiece(int idx) {
  switch (idx) {
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
      if (pField[i][j].getColor() == IPieceTurqoise)
        output += "Turq ";

      else if (pField[i][j].getColor() == OPieceYellow) {
        output += "Yell ";
      }

      else if (pField[i][j].getColor() == JPieceBlue) {
        output += "Blue ";
      }

      else if (pField[i][j].getColor() == LPieceOrange) {
        output += "Oran ";
      }

      else if (pField[i][j].getColor() == SPieceGreen) {
        output += "Gree ";
      }

      else if (pField[i][j].getColor() == ZPieceRed) {
        output += "Redd ";
      }

      else if (pField[i][j].getColor() == TPiecePurple) {
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

//Creates a blank board
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

  translate(pFieldWidth *1.275, height * 0.190);
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

PShape getPieceGraphic(int idx) { //for the next piece: determinePiece() and which() won't work for this as they only obtain the current piece
  switch (idx) {
    case 0: return IPiece;
    case 1: return OPiece;
    case 2: return JPiece;
    case 3: return LPiece;
    case 4: return SPiece;
    case 5: return ZPiece;
    default: return TPiece; //case 6
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

  setField(); //creates the playing field (blank though)
  createPieces(); //this is only used to generate PShapes that can be used in the next piece box.
}

void draw() {
  if (!gameOver) {
    background(backgroundGray); //clear screen
    ++frame; //unless you have the program running a year in a row, this is never overflowing
    if (pieceLocked) ++framesPieceLocked; //delay a new piece being spawned so that the game doesn't become impossible too soon
    if (!pieceLocked) userControls();
    displayField();
    lineCounter();
    scoreCounter();
    nextPieceBox();
    levelCounter();
    //debug();

    //Controls the speed of the game
    if (frame % getSpeed() == 0) {
      currPiece = moveDown();

      //Choose a new piece
      if (pieceLocked && framesPieceLocked >= 15) {
        dx = 0; //reset back to the top of the screen
        dy = 0;
        curr = next;
        currPiece = determinePiece(curr);
        next = (int) random(7);
        rotation = 0;
        pieceLocked = false;
        framesPieceLocked = 0;
      }
    }

    shape(currPiece); //show the current falling piece
    feed();
  }

  //Game over!
  else {
    ++framesAfterLoss;

    if (framesAfterLoss == 1) { //only draw this once
      background(backgroundGray);
      displayField();
      lineCounter();
      scoreCounter();
      nextPieceBox();
      levelCounter();
    }

    //Animation for loss
    if (framesAfterLoss % 3 == 0 && framesAfterLoss < 183) { //61 bars
      rectMode(CENTER);
      fill(barColors[colorIdx % 3]);
      stroke(barColors[colorIdx % 3]);
      rect(pFieldTopX - 13.7, yPos, pFieldWidth, lh/3);
      ++colorIdx;
      yPos += lh/3;
    }
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
    case 'h': //rotate counterclockwise
      if (!keyLock) {
        currPiece = rotateLeft();
        keyLock = true;
      }

      break;
    case 'j': //rotate clockwise
      if (!keyLock) {
        currPiece = rotateRight();
        keyLock = true;
      }

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
    case 'h':
      keyLock = false;
      break;
    case 'j':
      keyLock = false;
      break;
  }
}