boolean keyLock = false; //for keys that shouldn't be held down
boolean aPressed, dPressed, sPressed = false;
int framesAPressed, framesDPressed, framesSPressed = 0; //for implementing the DAS mechanic
boolean paused = false;

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
