float YBound = pFieldTopY + 24*lh; //20 from just pfield but then another 4 because of the lowest a piece child is (rect)
PShape rotateLeft() {
  if (Possible()) {
  if (rotation == 0) rotation = maxRotations - 1;
  else rotation--; //to ensure looping back to the correct rotation index
  }
  return which();
}

PShape rotateRight() {
  if (Possible()) {
  if (rotation == maxRotations - 1) rotation = 0;
  else rotation++;
  }
  return which();
}

PShape moveDown() {
  if (Possible())
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
    case 'J': return createJ(rotation);
    case 'L': return createL(rotation);
    case 'S': return createS(rotation);
    case 'Z': return createZ(rotation);
    case 'O': return createO();
    default: return createT(rotation); //case 'T'
  }
}

boolean Possible() {
  return (ny1 <= YBound && ny2 <= YBound && ny3 <= YBound && ny4 <= YBound);
}
