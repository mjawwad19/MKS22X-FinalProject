PShape createI() {
  fill(IPieceTurqoise);
  stroke(255);
  I = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2, height/2 - lineHeight, lineHeight, lineHeight);
  b2 = createShape(RECT, width/2, height/2, lineHeight, lineHeight);
  b3 = createShape(RECT, width/2, height/2 + lineHeight, lineHeight, lineHeight);
  b4 = createShape(RECT, width/2, height/2 + 2 *lineHeight, lineHeight, lineHeight);
  I.addChild(b1);
  I.addChild(b2);
  I.addChild(b3);
  I.addChild(b4);
  return I;
}

 PShape createJ() {
  fill(JPieceBlue);
  stroke(255);
  J = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2, height/2 - lineHeight, lineHeight, lineHeight);
  b2 = createShape(RECT, width/2, height/2, lineHeight, lineHeight);
  b3 = createShape(RECT, width/2, height/2 + lineHeight, lineHeight, lineHeight);
  b4 = createShape(RECT, width/2 - lineHeight, height/2 + lineHeight, lineHeight, lineHeight);
  J.addChild(b1);
  J.addChild(b2);
  J.addChild(b3);
  J.addChild(b4);
  return J;
}

 PShape createL() {
  fill(LPieceOrange);
  stroke(255);
  L = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2, height/2 - lineHeight, lineHeight, lineHeight);
  b2 = createShape(RECT, width/2, height/2, lineHeight, lineHeight);
  b3 = createShape(RECT, width/2, height/2 + lineHeight, lineHeight, lineHeight);
  b4 = createShape(RECT, width/2 + lineHeight, height/2 + lineHeight, lineHeight, lineHeight);
  L.addChild(b1);
  L.addChild(b2);
  L.addChild(b3);
  L.addChild(b4);
  return L;
}

 PShape createS() {
  fill(SPieceGreen);
  stroke(255);
  S = createShape(GROUP);
  rectMode(CENTER);
  b2 = createShape(RECT, width/2 - lineHeight, height/2, lineHeight, lineHeight);
  b1 = createShape(RECT, width/2, height/2, lineHeight, lineHeight);
  b3 = createShape(RECT, width/2 - lineHeight, height/2 - lineHeight, lineHeight, lineHeight);
  b4 = createShape(RECT, width/2 -(2*lineHeight), height/2 - lineHeight, lineHeight, lineHeight);
  S.addChild(b1);
  S.addChild(b2);
  S.addChild(b3);
  S.addChild(b4);
  return S;
}

 PShape createZ() {
  fill(ZPieceRed);
  stroke(255);
  Z = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2, height/2, lineHeight, lineHeight);
  b2 = createShape(RECT, width/2 +lineHeight, height/2, lineHeight, lineHeight);
  b3 = createShape(RECT, width/2 +lineHeight, height/2 - lineHeight, lineHeight, lineHeight);
  b4 = createShape(RECT, width/2 + (2*lineHeight), height/2 - lineHeight, lineHeight, lineHeight);
  Z.addChild(b1);
  Z.addChild(b2);
  Z.addChild(b3);
  Z.addChild(b4);
  return Z;
}

 PShape createO() {
  fill(OPieceYellow);
  stroke(255);
  O = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2, height/2, lineHeight, lineHeight);
  b2 = createShape(RECT, width/2 + lineHeight, height/2, lineHeight, lineHeight);
  b3 = createShape(RECT, width/2, height/2 - lineHeight, lineHeight, lineHeight);
  b4 = createShape(RECT, width/2 + lineHeight, height/2 - lineHeight, lineHeight, lineHeight);
  O.addChild(b1);
  O.addChild(b2);
  O.addChild(b3);
  O.addChild(b4);
  return O;
}

PShape createT() {
  fill(TPiecePurple);
  stroke(255);
  T = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2 - lineHeight, height/2, lineHeight, lineHeight);
  b2 = createShape(RECT, width/2, height/2, lineHeight, lineHeight);
  b3 = createShape(RECT, width/2 + lineHeight, height/2, lineHeight, lineHeight);
  b4 = createShape(RECT, width/2, height/2 +lineHeight, lineHeight, lineHeight);
  T.addChild(b1);
  T.addChild(b2);
  T.addChild(b3);
  T.addChild(b4);
  return T;
}
