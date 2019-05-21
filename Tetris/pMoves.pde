PShape rotateLeft() { // <-- avoid this atm
  //All of these will clear the original pShape drawn and redraw modifying certain x's and y's {
  if (rotation == 0) rotation = maxRotations - 1;
  else rotation--; //to ensure looping back to the correct rotation index
  return which();
}

PShape rotateRight() {
  if (rotation == maxRotations - 1) rotation = 0;
  else rotation++;
  return which();
}

PShape moveDown() {
  if (dy < 18)
    dy++;

  else
    pieceLocked = true;

  return which();
}

PShape moveLeft() {
  if (dx > -4)
    dx--;

  return which();
}

PShape moveRight() {
  if (dx < 3)
    dx++;

  return which();
}

//For when you read this: I'm still not sure what t does.
PShape which() {
  switch (t) {
    case 'I': return createI(rotation);
    case 'J': return createL(rotation);
    case 'L': return createL(rotation);
    case 'S': return createS(rotation);
    case 'Z': return createZ(rotation);
    default: return createT(rotation); //case 'T'
  }
}
