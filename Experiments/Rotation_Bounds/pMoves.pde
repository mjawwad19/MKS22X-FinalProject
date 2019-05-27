PShape rotateLeft() {
   if (fixRotation()) {
    if (leftBounds() && rightBounds() && bottomBounds()) {
        if (rotation == 0) rotation = maxRotations - 1;
        else rotation--; //to ensure looping back to the correct rotation index
    }
  }
  //in the case leftBound/rightBound returns false because too close to edge)
 /* else if ((!leftBounds() || !rightBounds()) && fixRotation()){
    if (rotation == 0) rotation = maxRotations -1;
    else rotation--;
  }*/

  return which();
}

PShape rotateRight() {
  if (fixRotation()) {
    if (leftBounds() && rightBounds() && bottomBounds()) {
      if (rotation == maxRotations - 1) rotation = 0;
      else rotation++;
    }
  }
 /* else if ((!leftBounds() || !rightBounds()) && fixRotation()){
    if (rotation == 0) rotation = maxRotations -1;
    else rotation--;
  }*/

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
    return (pField[convertY(ny1)][convertX(nx1) -1].getColor() == black) &&
      (pField[convertY(ny2)][convertX(nx2)-1].getColor() == black) &&
      (pField[convertY(ny3)][convertX(nx3)-1].getColor() == black) &&
      (pField[convertY(ny4)][convertX(nx4)-1].getColor() == black);
  }

  catch (ArrayIndexOutOfBoundsException e) {
    return false;
  }
}


boolean rightBounds() {
  try {
    return (pField[convertY(ny1)][convertX(nx1)+1].getColor() == black) &&
      (pField[convertY(ny2)][convertX(nx2)+1].getColor() == black) &&
      (pField[convertY(ny3)][convertX(nx3)+1].getColor() == black) &&
      (pField[convertY(ny4)][convertX(nx4)+1].getColor() == black);
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

//Feed a piece that has been locked into the pField array.
void feed() {
  if (pieceLocked) {
    pField[convertY(ny1)][convertX(nx1)].setColor(c);
    pField[convertY(ny2)][convertX(nx2)].setColor(c);
    pField[convertY(ny3)][convertX(nx3)].setColor(c);
    pField[convertY(ny4)][convertX(nx4)].setColor(c);
  }
}

//these methods use the joints (the places that always stay constant in rotation to determine if allowed
boolean iRotation() {
  return (convertX(nx3) >= 2 && convertX(nx3) <= 8
    && convertY(ny3) >=2  /*&& convertY(ny3) <= 18*/);
}

boolean jRotation() {
  return (convertX(nx2) >= 1 && convertX(nx2) <= 8 
    && convertY(ny2) >= 1 /* && convertY(ny2) <= 18*/);
}
//the same as j rotation:
boolean lRotation() {
  return jRotation();
}
//the joint n3 is always constant
boolean sRotation() {
  return (convertX(nx3) >= 1 && convertX(nx3) <= 8 
    &&  convertY(ny3) >= 1 /*&& convertY(ny3) <= 18*/);
}
// the joint n3 is always constant now
boolean zRotation() {
  return sRotation();
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
