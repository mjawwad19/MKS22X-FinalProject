import java.util.*;
import processing.sound.*;

//Useful globally
PFont font;
PFont smallFont;
int frame = 0; //helpful to keep track of as the speed of the game is based on 60 fps
color backgroundGray = color(64, 71, 71);
color black = color(0, 0, 0);
color white = color(255, 255, 255);
boolean transitioned = false;

//Music
SoundFile bgMusic;

//startup
boolean start0 = true;
boolean start1 = false;
boolean start2 = false;

//Piece colors
color IPieceTurqoise = color(0, 255, 255);
color OPieceYellow = color(255, 255, 0);
color JPieceBlue = color(0, 0, 204);
color LPieceOrange = color(255, 153, 0);
color SPieceGreen = color(0, 255, 0);
color ZPieceRed = color(255, 0, 0);
color TPiecePurple = color(204, 51, 255);

PShape b1, b2, b3, b4; //the 4 blocks of a tetromino
float x1, x2, x3, x4, y1, y2, y3, y4; //the corresponding coordinates
float nx1, nx2, nx3, nx4, ny1, ny2, ny3, ny4; //useful for checking bounds
PShape I, O, J, L, S, Z, T;
int rotation = 0; //hmm the rotation bug seems to be gone, setting it back to 0 for now
int maxRotations;
int dx = 0; //distance away from spawn point (top center of screen)
int dy = 0;

//For the counters
int lines, score = 0;
<<<<<<< HEAD
<<<<<<< HEAD
int level = 15;
int startLevel = level;

=======
int startLevel;
int level;
>>>>>>> 52eea0a8ba8ac0063a6d3ba58532c13ccc60f28a
=======
int startLevel;
int level;
>>>>>>> 52eea0a8ba8ac0063a6d3ba58532c13ccc60f28a
void setup() {
  size(960, 720);
  frameRate(60); //believe this is by default but whatever
  background(backgroundGray);
  font = createFont("PressStart2P-Regular.ttf", 28);
  smallFont = createFont("PressStart2P-Regular.ttf", 20);

  currPiece = determinePiece(curr);
  pieceStats();
  setField(); //creates the playing field (blank though)
  createPieces(); //this is only used to generate PShapes that can be used in the next piece box.

  if (start0)
    start0();
  else if (start1) {
    start1();
    if (indexM  != 3)bgMusic.play();
}
<<<<<<< HEAD
<<<<<<< HEAD
  else if (start2)
    start2();

  println(level);
=======
=======
>>>>>>> 52eea0a8ba8ac0063a6d3ba58532c13ccc60f28a
  else if (start2) {
    start2(); 
    startLevel = cLevel();
    level = cLevel();
  }
<<<<<<< HEAD
>>>>>>> 52eea0a8ba8ac0063a6d3ba58532c13ccc60f28a
=======
>>>>>>> 52eea0a8ba8ac0063a6d3ba58532c13ccc60f28a
}

//1:50 music 1, 6600 frames

void draw() {
  if (start0) {
    background(s0);
  } else if (start1) {
    start1();
    background(s1);
    cycleMChoice();
    musics();
    cMusic();
  } else if (start2) {
    start2();
    background(s2);
    cycleLChoice();
    levels();
    level = cLevel();
    startLevel = cLevel();
    
    
  } else {
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
      statistics();

      if (indexM != 3 && indexM == 0) { //music 1 loop
        if (frame % 6600 == 0) {
          bgMusic.stop();
          bgMusic.play();
        }
      }

      if (indexM != 3 && indexM == 1) { //music 2 loop
        if (frame % 4080 == 0) {
          bgMusic.stop();
          bgMusic.play();
        }
      }

      if (indexM != 3 && indexM == 2) { //music 2 loop
        if (frame % 2820 == 0) {
          bgMusic.stop();
          bgMusic.play();
        }
      }

      //Depends on the speed/level of the game, basically the game logic is here (gameSpeed.pde)
      tasksTiedToLevel();

      shape(currPiece); //show the current falling piece

      //Avoid the shape from sticking out at the top
      fill(backgroundGray);
      stroke(backgroundGray);
      rect(width * 0.50, height * 0.17, pFieldWidth, lh - 2);
      feed();
    }

    //Game over!
    else {
      ++framesAfterLoss; //log this for the animation

      if (framesAfterLoss == 1) //only draw this once
        drawLastFrame();

      lossAnimation();
    }
  }
}

void keyPressed() {
  switch (key) {
    case (char)10: //pause function - this is the enter key
    if (looping) {
      noLoop();
      if (indexM != 3) bgMusic.pause();
    } else {
      loop();
      if (indexM != 3) bgMusic.play();
    }

    break;
 /* case '-': //proof of concept: decrease level/speed
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
    break;*/
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
  keyLock = false;
  switch (key) {
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
  }
}

//just goes through screens
void mouseClicked() {
  if (start0) {
    start0 = false;
    start1 = true;
  } else if (start1) {
    start1 = false;
    start2 = true;
  } else if (start2) {
    start2 = false;
  }
}
