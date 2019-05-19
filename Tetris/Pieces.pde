PShape IPiece, OPiece, JPiece, LPiece, SPiece, ZPiece, TPiece;

void createPieces() {
  //Create I piece shape
  IPiece = createShape();
  strokeWeight(2);
  IPiece.beginShape();
  IPiece.fill(IPieceTurqoise);
  IPiece.vertex(0, 0);
  IPiece.vertex(0, lineHeight * 4);
  IPiece.vertex(lineHeight, lineHeight * 4);
  IPiece.vertex(lineHeight, 0);
  IPiece.endShape(CLOSE);

  //Create O piece shape
  OPiece = createShape();
  OPiece.beginShape();
  OPiece.fill(OPieceYellow);
  OPiece.vertex(0, 0);
  OPiece.vertex(0, lineHeight * 2);
  OPiece.vertex(lineHeight * 2, lineHeight * 2);
  OPiece.vertex(lineHeight * 2, 0);
  OPiece.endShape(CLOSE);

  //Create J piece shape
  JPiece = createShape();
  JPiece.beginShape();
  JPiece.fill(JPieceBlue);
  JPiece.vertex(0, 0);
  JPiece.vertex(0, lineHeight * 1);
  JPiece.vertex(lineHeight * 2, lineHeight * 1);
  JPiece.vertex(lineHeight * 2, lineHeight * 2);
  JPiece.vertex(lineHeight * 3, lineHeight * 2);
  JPiece.vertex(lineHeight * 3, 0);
  JPiece.endShape(CLOSE);

  //Create L piece shape
  LPiece = createShape();
  LPiece.beginShape();
  LPiece.fill(LPieceOrange);
  LPiece.vertex(0, 0);
  LPiece.vertex(lineHeight * 3, 0);
  LPiece.vertex(lineHeight * 3, lineHeight * 1);
  LPiece.vertex(lineHeight * 1, lineHeight * 1);
  LPiece.vertex(lineHeight * 1, lineHeight * 2);
  LPiece.vertex(0, lineHeight * 2);
  LPiece.endShape(CLOSE);

  //Create S piece shape
  SPiece = createShape();
  SPiece.beginShape();
  SPiece.fill(SPieceGreen);
  SPiece.vertex(lineHeight * 3, 0);
  SPiece.vertex(lineHeight * 1, 0);
  SPiece.vertex(lineHeight * 1, lineHeight * 1);
  SPiece.vertex(0, lineHeight * 1);
  SPiece.vertex(0, lineHeight * 2);
  SPiece.vertex(lineHeight * 2, lineHeight * 2);
  SPiece.vertex(lineHeight * 2, lineHeight * 1);
  SPiece.vertex(lineHeight * 3, lineHeight * 1);
  SPiece.endShape(CLOSE);

  //Create Z piece shape
  ZPiece = createShape();
  ZPiece.beginShape();
  ZPiece.fill(ZPieceRed);
  ZPiece.vertex(0, 0);
  ZPiece.vertex(lineHeight * 2, 0);
  ZPiece.vertex(lineHeight * 2, lineHeight * 1);
  ZPiece.vertex(lineHeight * 3, lineHeight * 1);
  ZPiece.vertex(lineHeight * 3, lineHeight * 2);
  ZPiece.vertex(lineHeight * 1, lineHeight * 2);
  ZPiece.vertex(lineHeight * 1, lineHeight * 1);
  ZPiece.vertex(0, lineHeight * 1);
  ZPiece.endShape(CLOSE);

  //Create T piece shape
  TPiece = createShape();
  TPiece.beginShape();
  TPiece.fill(TPiecePurple);
  TPiece.vertex(0, lineHeight * 1);
  TPiece.vertex(lineHeight * 1, lineHeight * 1);
  TPiece.vertex(lineHeight * 1, 0);
  TPiece.vertex(lineHeight * 2, 0);
  TPiece.vertex(lineHeight * 2, lineHeight * 1);
  TPiece.vertex(lineHeight * 3, lineHeight * 1);
  TPiece.vertex(lineHeight * 3, lineHeight * 2);
  TPiece.vertex(0, lineHeight * 2);
  TPiece.endShape(CLOSE);
}

class Pieces {
  PShape piece;
  int rotation = 0; //in degrees

  void rotateLeft() {

  }

  void rotateRight() {

  }

  void forceDown() {

  }

  void moveLeft() {

  }

  void moveRight() {

  }

  void lock() {

  }
}
