PShape IPiece, OPiece, JPiece, LPiece, SPiece, ZPiece, TPiece;

void createPieces() {
  //Create I piece shape
  IPiece = createShape();
  IPiece.beginShape();
  IPiece.fill(IPieceTurqoise);
  IPiece.vertex(0, 0);
  IPiece.vertex(0, lh);
  IPiece.vertex(lh * 4, lh);
  IPiece.vertex(lh * 4, 0);
  IPiece.endShape(CLOSE);

  //Create O piece shape
  OPiece = createShape();
  OPiece.beginShape();
  OPiece.fill(OPieceYellow);
  OPiece.vertex(0, 0);
  OPiece.vertex(0, lh * 2);
  OPiece.vertex(lh * 2, lh * 2);
  OPiece.vertex(lh * 2, 0);
  OPiece.endShape(CLOSE);

  //Create J piece shape
  JPiece = createShape();
  JPiece.beginShape();
  JPiece.fill(JPieceBlue);
  JPiece.vertex(0, 0);
  JPiece.vertex(0, lh * 1);
  JPiece.vertex(lh * 2, lh * 1);
  JPiece.vertex(lh * 2, lh * 2);
  JPiece.vertex(lh * 3, lh * 2);
  JPiece.vertex(lh * 3, 0);
  JPiece.endShape(CLOSE);

  //Create L piece shape
  LPiece = createShape();
  LPiece.beginShape();
  LPiece.fill(LPieceOrange);
  LPiece.vertex(0, 0);
  LPiece.vertex(lh * 3, 0);
  LPiece.vertex(lh * 3, lh * 1);
  LPiece.vertex(lh * 1, lh * 1);
  LPiece.vertex(lh * 1, lh * 2);
  LPiece.vertex(0, lh * 2);
  LPiece.endShape(CLOSE);

  //Create S piece shape
  SPiece = createShape();
  SPiece.beginShape();
  SPiece.fill(SPieceGreen);
  SPiece.vertex(lh * 3, 0);
  SPiece.vertex(lh * 1, 0);
  SPiece.vertex(lh * 1, lh * 1);
  SPiece.vertex(0, lh * 1);
  SPiece.vertex(0, lh * 2);
  SPiece.vertex(lh * 2, lh * 2);
  SPiece.vertex(lh * 2, lh * 1);
  SPiece.vertex(lh * 3, lh * 1);
  SPiece.endShape(CLOSE);

  //Create Z piece shape
  ZPiece = createShape();
  ZPiece.beginShape();
  ZPiece.fill(ZPieceRed);
  ZPiece.vertex(0, 0);
  ZPiece.vertex(lh * 2, 0);
  ZPiece.vertex(lh * 2, lh * 1);
  ZPiece.vertex(lh * 3, lh * 1);
  ZPiece.vertex(lh * 3, lh * 2);
  ZPiece.vertex(lh * 1, lh * 2);
  ZPiece.vertex(lh * 1, lh * 1);
  ZPiece.vertex(0, lh * 1);
  ZPiece.endShape(CLOSE);

  //Create T piece shape
  TPiece = createShape();
  TPiece.beginShape();
  TPiece.fill(TPiecePurple);
  TPiece.vertex(0, lh * 1);
  TPiece.vertex(lh * 1, lh * 1);
  TPiece.vertex(lh * 1, 0);
  TPiece.vertex(lh * 2, 0);
  TPiece.vertex(lh * 2, lh * 1);
  TPiece.vertex(lh * 3, lh * 1);
  TPiece.vertex(lh * 3, lh * 2);
  TPiece.vertex(0, lh * 2);
  TPiece.endShape(CLOSE);
}
