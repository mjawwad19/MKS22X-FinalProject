PShape rotateLeft() {
  if (fixRotation()) {
    if (leftBounds() && rightBounds() && bottomBounds() && innerBounds()) {
      if (rotation == 0) rotation = maxRotations - 1;
      else rotation--; //to ensure looping back to the correct rotation index

      rotateSound.stop();
      rotateSound.play();
    }
  }
  return which();
}

PShape rotateRight() {
  if (fixRotation()) {
    if (leftBounds() && rightBounds() && bottomBounds() && innerBounds()) {
      //if (rotation == maxRotations - 1) rotation = 0;
      rotation++;

      rotateSound.stop();
      rotateSound.play();
    }
  }

  return which();
}

PShape moveDown() {
  if (bottomBounds())
    dy++;

  else
    pieceLocked = true;

  if (dy == 0)
    gameOver = true;

  return which();
}

PShape moveLeft() {
  if (convertX(nx1) > 0  && convertX(nx2) > 0 &&
      convertX(nx3) > 0  && convertX(nx4) > 0 && leftBounds()) {
    dx--;
    pieceMove.stop();
    pieceMove.play();
  }

  else {
    framesAPressed = 15;
    framesDPressed = 15;
  }

  return which();
}

PShape moveRight() {
  if (convertX(nx1) <9  && convertX(nx2) <9 &&
      convertX(nx3) <9  && convertX(nx4) <9 && rightBounds()) {
    dx++;
    pieceMove.stop();
    pieceMove.play();
  }

  else {
    framesAPressed = 15;
    framesDPressed = 15;
  }

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
  if (convertX(nx1) == 0 || convertX(nx2) == 0 || convertX(nx3) == 0 || convertX(nx4) == 0) {
    return (pField[convertY(ny1)][convertX(nx1)+1].getColor() == black) &&
      (pField[convertY(ny2)][convertX(nx2)+1].getColor() == black) &&
      (pField[convertY(ny3)][convertX(nx3)+1].getColor() == black) &&
      (pField[convertY(ny4)][convertX(nx4)+1].getColor() == black);
  }
  else {
    return (pField[convertY(ny1)][convertX(nx1) -1].getColor() == black) &&
      (pField[convertY(ny2)][convertX(nx2)-1].getColor() == black) &&
      (pField[convertY(ny3)][convertX(nx3)-1].getColor() == black) &&
      (pField[convertY(ny4)][convertX(nx4)-1].getColor() == black);
  }
}


boolean rightBounds() {
  if (convertX(nx1) == 8 || convertX(nx2) == 8 || convertX(nx3) == 8 || convertX(nx4) == 8) {
     return (pField[convertY(ny1)][convertX(nx1) -1].getColor() == black) &&
      (pField[convertY(ny2)][convertX(nx2)-1].getColor() == black) &&
      (pField[convertY(ny3)][convertX(nx3)-1].getColor() == black) &&
      (pField[convertY(ny4)][convertX(nx4)-1].getColor() == black);
  }
  else{
    return (pField[convertY(ny1)][convertX(nx1)+1].getColor() == black) &&
      (pField[convertY(ny2)][convertX(nx2)+1].getColor() == black) &&
      (pField[convertY(ny3)][convertX(nx3)+1].getColor() == black) &&
      (pField[convertY(ny4)][convertX(nx4)+1].getColor() == black);
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

boolean innerBounds() {
     return (pField[convertY(ny1)][convertX(nx1)].getColor() == black) &&
      (pField[convertY(ny2)][convertX(nx2)].getColor() == black) &&
      (pField[convertY(ny3)][convertX(nx3)].getColor() == black) &&
      (pField[convertY(ny4)][convertX(nx4)].getColor() == black);
  }

//Feed a piece that has been locked into the pField array.
void feed() {
  if (pieceLocked) {
    try {
      pField[convertY(ny1)][convertX(nx1)].setColor(c);
      pField[convertY(ny2)][convertX(nx2)].setColor(c);
      pField[convertY(ny3)][convertX(nx3)].setColor(c);
      pField[convertY(ny4)][convertX(nx4)].setColor(c);
    }
  catch (Exception e) {
  }
  }
}

//these methods use the joints (the places that always stay constant in rotation to determine if allowed
boolean iRotation() {
  return (convertX(nx3) >= 2 && convertX(nx3) <= 8
    && convertY(ny3) >= 1  /*&& convertY(ny3) <= 18*/);
}

boolean jRotation() {
  return (convertX(nx2) >= 1 && convertX(nx2) <= 8
    && convertY(ny2) >= 0 /* && convertY(ny2) <= 18*/);
}
//the same as j rotation:
boolean lRotation() {
  return jRotation();
}
//the joint n3 is always constant
boolean sRotation() {
  return (convertX(nx3) >= 1 && convertX(nx3) <= 8
    &&  convertY(ny3) >= 0 /*&& convertY(ny3) <= 18*/);
}
// the joint n2 is always constant now
boolean zRotation() {
  return jRotation();
}

// the joint n2 is always constant
boolean tRotation() {
  return jRotation();
}

boolean fixRotation() {
  switch (t) {
  case 'I':
    return iRotation();
  case 'J':
    return jRotation();
  case 'L':
    return lRotation();
  case 'S':
    return sRotation();
  case 'Z':
    return zRotation();
  case 'O':
    return true;
  default:
    return tRotation();
  }
}
