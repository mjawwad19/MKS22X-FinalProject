class EasyShapes {
}
PShape b1, b2, b3, b4;
PShape I, O, J, L, S, Z, T;

PShape createI() {
  I = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2, height/2 - 100, 100, 100);
  b2 = createShape(RECT, width/2, height/2, 100, 100);
  b3 = createShape(RECT, width/2, height/2 + 100, 100, 100);
  b4 = createShape(RECT, width/2, height/2 + 200, 100, 100);
  I.addChild(b1);
  I.addChild(b2);
  I.addChild(b3);
  I.addChild(b4);

  return I;
}

void createJ() {
  J = createShape(GROUP);
  rectMode(CENTER);
  b1 = createShape(RECT, width/2, height/2 - 100, 100, 100);
  b2 = createShape(RECT, width/2, height/2, 100, 100);
  b3 = createShape(RECT, width/2, height/2 + 100, 100, 100);
  b4 = createShape(RECT, width/2 - 100, height/2 + 100, 100, 100);
  J.addChild(b1);
  J.addChild(b2);
  J.addChild(b3);
  J.addChild(b4);
}

void setup() {
  size(500, 500);
  fill(255);
  createI();
  //A.createI();
  /*fill(0);
   createJ();*/
}

void draw() {
  background(204);
  shape(createI());
  //shape(J);
}
