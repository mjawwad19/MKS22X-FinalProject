PShape rotateLeft() {
  //all of these will clear the original pShape drawn and redraw modifying certain x's and y'svoid rotateLeft() {
  rotation = Math.abs(rotation -1) % maxRotation;
  //System.out.println(rotation);
  if (rotation == 0) return createI0();
  else return createI1();
}
PShape rotateRight() {
  rotation = Math.abs((rotation + 1)%maxRotation);
  if (rotation ==  0) return createI0();
  else return createI1();
}
void moveDown() {
  createPiece(x1, y1 + lineHeight, x2, y2 + lineHeight, 
    x3, y3 + lineHeight, x4, y4 + lineHeight, currPiece);
};
void moveLeft() {
  createPiece(x1 - lineHeight, y1, x2 - lineHeight, y2, 
    x3 - lineHeight, y3, x4 - lineHeight, y4, currPiece);
};
void moveRight() {
  createPiece(x1 + lineHeight, y1, x2 + lineHeight, y2, 
    x3 + lineHeight, y3, x4 + lineHeight, y4, currPiece);
};
