PShape createPiece(float x1, float y1, float x2, float y2, float x3, float y3, 
  float x4, float y4, color col, PShape temp ) {
  fill(col);
  stroke(255);
  temp = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, x1, y1, lineHeight, lineHeight);
  b2 = createShape(RECT, x2, y2, lineHeight, lineHeight); 
  b3 = createShape(RECT, x3, y3, lineHeight, lineHeight);
  b4 = createShape(RECT, x4, y4, lineHeight, lineHeight); 
  temp.addChild(b1);
  temp.addChild(b2);
  temp.addChild(b3);
  temp.addChild(b4);
  return temp;
}



PShape createI() {
  maxRotation = 2;
  return createPiece(width/2, height/2 - lineHeight, width/2, height/2, 
    width/2, height/2 + lineHeight, width/2, height/2 + 2* lineHeight, 
    IPieceTurqoise, I);
}

PShape createJ() {
  maxRotation = 4;
  return createPiece(width/2, height/2 - lineHeight, width/2, height/2, 
    width/2, height/2 + lineHeight, width/2 - lineHeight, height/2 + lineHeight, 
    JPieceBlue, J);
}

PShape createL() {
  maxRotation = 4;
  return createPiece(width/2, height/2 - lineHeight, width/2, height/2, 
    width/2, height/2 + lineHeight, width/2 + lineHeight, height/2 +lineHeight, 
    LPieceOrange, L);
}

PShape createS() {
  maxRotation = 2;
  return createPiece(width/2 - lineHeight, height/2, width/2, height/2, 
    width/2 - lineHeight, height/2 - lineHeight, 
    width/2 -(2* lineHeight), height/2 -lineHeight, 
    SPieceGreen, S);
}

PShape createZ() {
  maxRotation = 2;
  return createPiece(width/2, height/2, width/2 + lineHeight, height/2, 
    width/2 + lineHeight, height/2 - lineHeight, 
    width/2 +(2* lineHeight), height/2 -lineHeight, 
    ZPieceRed, Z);
}

PShape createO() {
  maxRotation = 1;
  return createPiece(width/2, height/2, width/2 + lineHeight, height/2, 
    width/2, height/2 + lineHeight, 
    width/2 +lineHeight, height/2 +lineHeight, 
    OPieceYellow, O);
}

PShape createT() {
  maxRotation = 4;
  return createPiece(width/2 - lineHeight, height/2, width/2, height/2, 
    width/2 + lineHeight, height/2, 
    width/2, height/2 +lineHeight, 
    TPiecePurple, T);
}
