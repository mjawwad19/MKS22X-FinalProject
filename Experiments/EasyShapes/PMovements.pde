PShape rotateLeft() {
  //all of these will clear the original pShape drawn and redraw modifying certain x's and y'svoid rotateLeft() {
  rotation = Math.abs(rotation -1) % maxRotations;
  return createI(rotation);
}
PShape rotateRight() {
  rotation = Math.abs((rotation + 1)%maxRotations);
  return createI(rotation);
}
void moveDown() {
  createPiece(x1, y1 + lineHeight, x2, y2 + lineHeight,
    x3, y3 + lineHeight, x4, y4 + lineHeight, currentPiece);
};
void moveLeft() {
  createPiece(x1 - lineHeight, y1, x2 - lineHeight, y2,
    x3 - lineHeight, y3, x4 - lineHeight, y4, currentPiece);
};
void moveRight() {
  createPiece(x1 + lineHeight, y1, x2 + lineHeight, y2,
    x3 + lineHeight, y3, x4 + lineHeight, y4, currentPiece);
};
