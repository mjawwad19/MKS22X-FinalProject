PShape b1, b2, b3, b4;
float x1, x2, x3, x4, y1, y2, y3, y4;
PShape I, O, J, L, S, Z, T;
float lineHeight = 27.0;
//Piece colors
color IPieceTurqoise = color(0, 255, 255);
color OPieceYellow = color(255, 255, 0);
color JPieceBlue = color(0, 0, 204);
color LPieceOrange = color(255, 153, 0);
color SPieceGreen = color(0, 255, 0);
color ZPieceRed = color(255, 0, 0);
color TPiecePurple = color(204, 51, 255);


int curr = (int) random(7);
PShape determine() {
  if (curr == 0)  return createI();
  else if (curr == 1) return createO();
   else if (curr == 2) return createJ();
   else if (curr == 3) return createL();
   else if (curr == 4) return createS();
   else if (curr == 5) return createZ();
   else return createT();
}
PShape currPiece;

void setup() {
  size(500, 500);
  fill(255);
  currPiece = determine();
}

void draw() {
  background(204);
  shape(currPiece);
}
