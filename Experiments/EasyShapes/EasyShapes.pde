color backgroundGray = color(64, 71, 71);

PShape b1, b2, b3, b4; //the 4 blocks in a tetromino
float x1, y1, x2, y2, x3, y3, x4, y4; //the corresponding coords of the 4 blocks
PShape I, O, J, L, S, Z, T;
float lineHeight = 27.0;
int rotation = 0;
int maxRotations;

//Piece colors
color IPieceTurqoise = color(0, 255, 255);
color OPieceYellow = color(255, 255, 0);
color JPieceBlue = color(0, 0, 204);
color LPieceOrange = color(255, 153, 0);
color SPieceGreen = color(0, 255, 0);
color ZPieceRed = color(255, 0, 0);
color TPiecePurple = color(204, 51, 255);

int currentPieceIndex = (int)random(7);

PShape chooseRandomPiece() {
  switch (currentPieceIndex) {
    case 0:
      return createI(0);
    case 1:
      return createO();
    case 2:
      return createJ();
    case 3:
      return createL();
    case 4:
      return createS();
    case 5:
      return createZ();
    case 6:
      return createT();
    //Using else is abhorrent to me in cases like this. 6 is a case here for clarity.
    default:
      return null;
  }
}

PShape currentPiece;
boolean rotateKeyLock = false;

void setup() {
  size(500, 500);
  fill(255);
  currentPiece = createI(0);
}

void draw() {
  background(backgroundGray);
  shape(currentPiece);

  /*
  if (mousePressed) {
   curr = (int) random(7);
   currPiece = determine();
  }
  */

  if (keyPressed && !rotateKeyLock) {
    if (key == 'a') {
    currentPiece = rotateLeft();
    rotateKeyLock = true;
    }

    if (key == 'd') {
      currentPiece = rotateRight();
      rotateKeyLock = true;
    }
  }
}

//To prevent a key held down from executing keyPressed until it is released
void keyReleased() {
  rotateKeyLock = false;
}
