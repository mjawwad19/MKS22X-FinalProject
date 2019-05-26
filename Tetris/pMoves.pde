PShape rotateLeft() {
  if (rightBounds()) {
    if (rotation == 0) rotation = maxRotations - 1;
    else rotation--; //to ensure looping back to the correct rotation index
  }
  return which();
}

PShape rotateRight() {
  if (rightBounds()) {
    if (rotation == maxRotations - 1) rotation = 0;
    else rotation++;
  }
  return which();
}

PShape moveDown() {
  if (bottomBounds())
    dy++;

  else
    pieceLocked = true;

  if (dy < 0)
    gameOver = true;

  return which();
}

PShape moveLeft() {
  if (leftBounds())
    dx--;

  return which();
}

PShape moveRight() {
  if (rightBounds())
    dx++;

  return which();
}

PShape which() {
  switch (t) {
  case 'I':
    return createI(rotation);
  case 'J':
    return createJ(rotation);
  case 'L':
    return createL(rotation);
  case 'S':
    return createS(rotation);
  case 'Z':
    return createZ(rotation);
  case 'O':
    return createO();
  default:
    return createT(rotation); //case 'T'
  }
}

boolean leftBounds() {
  try {
    return (pField[convertY(ny1)][convertX(nx1) - 1].getColor() == black) &&
           (pField[convertY(ny2)][convertX(nx2) - 1].getColor() == black) &&
           (pField[convertY(ny3)][convertX(nx3) - 1].getColor() == black) &&
           (pField[convertY(ny4)][convertX(nx4) - 1].getColor() == black);
  }

  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}

boolean rightBounds() {
  try {
    return (pField[convertY(ny1)][convertX(nx1) + 1].getColor() == black) &&
           (pField[convertY(ny2)][convertX(nx2) + 1].getColor() == black) &&
           (pField[convertY(ny3)][convertX(nx3) + 1].getColor() == black) &&
           (pField[convertY(ny4)][convertX(nx4) + 1].getColor() == black);
  }

  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}

boolean bottomBounds() {
  try {
    return (pField[convertY(ny1) + 1][convertX(nx1)].getColor() == black) &&
           (pField[convertY(ny2) + 1][convertX(nx2)].getColor() == black) &&
           (pField[convertY(ny3) + 1][convertX(nx3)].getColor() == black) &&
           (pField[convertY(ny4) + 1][convertX(nx4)].getColor() == black);
  }

  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}

void feed() {
  if (pieceLocked) {
    pField[convertY(ny1)][convertX(nx1)].setColor(c);
    pField[convertY(ny2)][convertX(nx2)].setColor(c);
    pField[convertY(ny3)][convertX(nx3)].setColor(c);
    pField[convertY(ny4)][convertX(nx4)].setColor(c);
  }
}
