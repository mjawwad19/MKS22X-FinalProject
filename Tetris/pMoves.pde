PShape rotateLeft() {
  //all of these will clear the original pShape drawn and redraw modifying certain x's and y'svoid rotateLeft() {
  rotation = Math.abs(rotation -1) % maxRotations;
  return createI(rotation);
}
PShape rotateRight() {
  rotation = Math.abs((rotation + 1)%maxRotations);
  return createI(rotation);
}

PShape moveDown() {
  dy++;
  return createI(rotation);
}
PShape moveLeft() {
  dx--;
  return createI(rotation);
}
PShape moveRight() {
  dx++;
  return createI(rotation);
}
