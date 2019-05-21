PShape rotateLeft() {
  //all of these will clear the original pShape drawn and redraw modifying certain x's and y'svoid rotateLeft() {
  if (rotation == 0) rotation = maxRotations -1;
  else rotation--;
  //to ensure looping back to right rotation form
  return which();
}
PShape rotateRight() {
  if (rotation == maxRotations-1) rotation = 0;
  else rotation ++;
  return which();
}

PShape moveDown() {
  dy++;
  return which();
}
PShape moveLeft() {
  dx--;
  return which();
}
PShape moveRight() {
  dx++;
  return which();
}

PShape which() {
  if (t == 'I') return createI(rotation);
  else if (t == 'J') return createJ(rotation);
  else if (t == 'L') return createL(rotation);
  else if (t == 'S') return createS(rotation);
  else if (t == 'Z') return createZ(rotation);
  else if (t == 'T') return createT(rotation);
  else return createO();
}
