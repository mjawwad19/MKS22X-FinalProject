color c;
char t;
PShape createPiece(float x1c, float y1c, float x2c, float y2c, float x3c, float y3c, 
  float x4c, float y4c, PShape temp) {
  fill(c);
  stroke(255);
  temp = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, x1c, y1c, lh, lh);
  b2 = createShape(RECT, x2c, y2c, lh, lh); 
  b3 = createShape(RECT, x3c, y3c, lh, lh);
  b4 = createShape(RECT, x4c, y4c, lh, lh); 
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
  c = IPieceTurqoise;
  t = 'I';
  if (r == 0) {
    nx1 = pFieldTopX + dx * lh;
    ny1 = pFieldTopY + dy *lh; 
    nx2 = pFieldTopX+ dx * lh;
    ny2 = pFieldTopY + lh + dy *lh;
    nx3 = pFieldTopX+ dx * lh; 
    ny3 = pFieldTopY + 2*lh + dy *lh;
    nx4 = pFieldTopX+ dx * lh; 
    ny4 = pFieldTopY + 3*lh + dy *lh;
  } else {
    nx1 = pFieldTopX - 2*lh+ dx * lh; 
    ny1 = pFieldTopY + dy *lh;
    nx2 = pFieldTopX - lh+ dx * lh; 
    ny2 = pFieldTopY + dy *lh;
    nx3 = pFieldTopX+ dx * lh; 
    ny3 = pFieldTopY + dy *lh;
    nx4 = pFieldTopX + lh+ dx * lh; 
    ny4 = pFieldTopY + dy *lh;
  }

  return createPiece(nx1, ny1, nx2, ny2, nx3, ny3, nx4, ny4, I);
}

PShape createJ(int r) {
  maxRotations = 4;
  c = JPieceBlue;
  t = 'J';
  if (r == 0) {
    nx1 = pFieldTopX+ dx * lh; 
    nx2 = pFieldTopX+ dx * lh; 
    nx3 = pFieldTopX+ dx * lh; 
    nx4 = pFieldTopX - lh+ dx * lh;
    ny1 = pFieldTopY + dy *lh; 
    ny2 = pFieldTopY + lh + dy *lh; 
    ny3 = pFieldTopY + 2*lh + dy *lh; 
    ny4 = pFieldTopY + 2*lh + dy *lh;
  } else if (r == 1) {
    nx1 = pFieldTopX - lh+ dx * lh; 
    nx2 = pFieldTopX+ dx * lh; 
    nx3 = pFieldTopX + lh+ dx * lh; 
    nx4 = pFieldTopX + lh+ dx * lh;
    ny1 = pFieldTopY + dy *lh; 
    y2 = pFieldTopY + dy *lh; 
    ny3 = pFieldTopY + dy *lh; 
    ny4 = pFieldTopY + lh + dy *lh;
  } else if (r == 2) {
    nx1 = pFieldTopX - lh+ dx * lh; 
    nx2 = pFieldTopX - lh+ dx * lh; 
    nx3 = pFieldTopY - lh+ dx * lh; 
    nx4 = pFieldTopX+ dx * lh;
    ny1 = pFieldTopY + 2*lh + dy *lh; 
    ny2 = pFieldTopY + lh + dy *lh; 
    ny3 = pFieldTopY + dy *lh; 
    ny4 = pFieldTopY + dy *lh;
  } else {
    nx1 = pFieldTopX + lh+ dx * lh; 
    nx2 = pFieldTopX+ dx * lh; 
    nx3 = pFieldTopX - lh+ dx * lh; 
    nx4 = pFieldTopX -lh+ dx * lh;
    ny1 = pFieldTopY + lh + dy *lh; 
    ny2 = pFieldTopY + lh + dy *lh; 
    ny3 = pFieldTopY + lh + dy *lh; 
    ny4 = pFieldTopY + dy *lh;
  }
  return createPiece(nx1, ny1, nx2, ny2, nx3, ny3, nx4, ny4, J);
}

PShape createL(int r) {
  maxRotation = 4;
  t = 'L';
  c = LPieceOrange;
  if (r==0) {
    nx1 =pFieldTopX+ dx * lh;
    nx2 =pFieldTopX+ dx * lh;
    nx3 =pFieldTopX+ dx * lh;
    nx4 =pFieldTopX + lh+ dx * lh;
    ny1 =pFieldTopY + dy *lh;
    ny2 =pFieldTopY + lh + dy *lh;
    ny3 =pFieldTopY + 2*lh + dy *lh;
    ny4 =pFieldTopY + 2*lh + dy *lh;
  }
  if (r==1) {
    nx1 =pFieldTopX - lh+ dx * lh;
    nx2 =pFieldTopX+ dx * lh;
    nx3 =pFieldTopX + lh+ dx * lh;
    nx4 =pFieldTopX + lh+ dx * lh;
    ny1 =pFieldTopY + lh + dy *lh;
    ny2 =pFieldTopY + lh + dy *lh;
    ny3 =pFieldTopY + lh + dy *lh;
    ny4 =pFieldTopY + dy *lh;
  }
  if (r==2) {
    nx1 =pFieldTopX+ dx * lh;
    nx2 =pFieldTopX+ dx * lh;
    nx3 =pFieldTopX+ dx * lh;
    nx4 =pFieldTopX -lh+ dx * lh;
    ny1 =pFieldTopY + 2*lh + dy *lh;
    ny2 =pFieldTopY + lh + dy *lh;
    ny3 =pFieldTopY + dy *lh;
    ny4 =pFieldTopY + dy *lh;
  } else {
    nx1 =pFieldTopX + lh+ dx * lh;
    nx2 =pFieldTopX+ dx * lh;
    nx3 =pFieldTopX - lh+ dx * lh;
    nx4 =pFieldTopX - lh+ dx * lh;
    ny1 =pFieldTopY + dy *lh;
    ny2 =pFieldTopY + dy *lh;
    ny3 =pFieldTopY + dy *lh;
    ny4 =pFieldTopY + lh + dy *lh;
  }
  return createPiece(nx1, ny1, nx2, ny2, nx3, ny3, nx4, ny4, L);
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
