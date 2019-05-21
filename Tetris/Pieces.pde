color c;
PShape createPiece(float x1c, float y1c, float x2c, float y2c, float x3c, float y3c,
  float x4c, float y4c, PShape temp) {
  fill(c);
  stroke(255);
  temp = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, x1c, y1c, lineHeight, lineHeight);
  b2 = createShape(RECT, x2c, y2c, lineHeight, lineHeight);
  b3 = createShape(RECT, x3c, y3c, lineHeight, lineHeight);
  b4 = createShape(RECT, x4c, y4c, lineHeight, lineHeight);
  temp.addChild(b1);
  temp.addChild(b2);
  temp.addChild(b3);
  temp.addChild(b4);
  x1 = x1c;
  x2 = x2c;
  x3 = x3c;
  x4= x4c;
  y1 = y1c;
  y2 = y1c;
  y3 = y3c;
  y4 = y4c;
  return temp;
}

color getCol() {
  return c;
}

PShape createI(int r) {
  maxRotations = 2;
  rotation = rotation % maxRotations;
  c = IPieceTurqoise;
  if (r == 0) {
    x1 = width/2;
    y1 = height/2 - lineHeight;
    x2 = width/2;
    y2 = height/2;
    x3 = width/2;
    y3 = height/2 + lineHeight;
    x4 = width/2;
    y4 = height/2 + 2* lineHeight;
  } else {
    x1 = width/2 - 2*lineHeight;
    y1 = height/2 - lineHeight;
    x2 = width/2 - lineHeight;
    y2 = height/2 - lineHeight;
    x3 = width/2;
    y3 = height/2 - lineHeight;
    x4 = width/2 + lineHeight;
    y4 = height/2 - lineHeight;
  }
  return createPiece(x1, y1, x2, y2, x3, y3, x4, y4, I);
}

PShape createJ() {
  maxRotations = 4;
  c = JPieceBlue;
  return createPiece(width/2, height/2 - lineHeight, width/2, height/2,
    width/2, height/2 + lineHeight, width/2 - lineHeight, height/2 + lineHeight, J);
}

PShape createL() {
  maxRotations = 4;
  c = LPieceOrange;
  return createPiece(width/2, height/2 - lineHeight, width/2, height/2,
    width/2, height/2 + lineHeight, width/2 + lineHeight, height/2 +lineHeight, L);
}

PShape createS() {
  maxRotations = 2;
  c = SPieceGreen;
  return createPiece(width/2 - lineHeight, height/2, width/2, height/2,
    width/2, height/2 - lineHeight,
    width/2 + lineHeight, height/2 - lineHeight,S);
}

PShape createZ() {
  maxRotations = 2;
  c = ZPieceRed;
  return createPiece(width/2 - lineHeight, height/2 -lineHeight, width/2, height/2 - lineHeight,
    width/2, height/2,
    width/2 + lineHeight, height/2, Z);
}

PShape createO() {
  maxRotations = 1;
  c = OPieceYellow;
  return createPiece(width/2, height/2, width/2 + lineHeight, height/2,
    width/2, height/2 + lineHeight,
    width/2 +lineHeight, height/2 +lineHeight, O);
}

PShape createT() {
  maxRotations = 4;
  c = TPiecePurple;
  return createPiece(width/2 - lineHeight, height/2, width/2, height/2,
    width/2 + lineHeight, height/2,
    width/2, height/2 +lineHeight, T);
}
