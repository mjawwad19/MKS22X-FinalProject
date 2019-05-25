float YBound = pFieldTopY + 24*lh; //20 from just pfield but then another 4 because of the lowest a piece child is (rect)
PShape rotateLeft() {
  if (leftBounds() && rightBounds()) {
    if (rotation == 0) rotation = maxRotations - 1;
    else rotation--; //to ensure looping back to the correct rotation index
  }
  return which();
}

PShape rotateRight() {
  if (leftBounds() && rightBounds()) {
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

boolean Possible() {
  return (ny1 <= YBound && ny2 <= YBound && ny3 <= YBound && ny4 <= YBound);
}

boolean leftBounds() {
  try {
    return (pField[convertY(y1)][convertX(x1) - 1].getColor() == black) &&
           (pField[convertY(y2)][convertX(x2) - 1].getColor() == black) &&
           (pField[convertY(y3)][convertX(x3) - 1].getColor() == black) &&
           (pField[convertY(y4)][convertX(x4) - 1].getColor() == black);
  }

  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}

boolean rightBounds() {
  try {
    return (pField[convertY(y1)][convertX(x1) + 1].getColor() == black) &&
           (pField[convertY(y2)][convertX(x2) + 1].getColor() == black) &&
           (pField[convertY(y3)][convertX(x3) + 1].getColor() == black) &&
           (pField[convertY(y4)][convertX(x4) + 1].getColor() == black);
  }

  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}

boolean bottomBounds() {
  try {
    return (pField[convertY(y1) + 1][convertX(x1)].getColor() == black) &&
           (pField[convertY(y2) + 1][convertX(x2)].getColor() == black) &&
           (pField[convertY(y3) + 1][convertX(x3)].getColor() == black) &&
           (pField[convertY(y4) + 1][convertX(x4)].getColor() == black);
  }

  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}

boolean collision() {
    return (pField[convertY(y1) + 1][convertX(x1)].getColor() == black) && //check below
           (pField[convertY(y2) + 1][convertX(x2)].getColor() == black) &&
           (pField[convertY(y3) + 1][convertX(x3)].getColor() == black) &&
           (pField[convertY(y4) + 1][convertX(x4)].getColor() == black);
}

void feed() {
  if (pieceLocked) {
    pField[convertY(ny1)][convertX(nx1)].setColor(c);
    pField[convertY(ny2)][convertX(nx2)].setColor(c);
    pField[convertY(ny3)][convertX(nx3)].setColor(c);
    pField[convertY(ny4)][convertX(nx4)].setColor(c);
  }
}
