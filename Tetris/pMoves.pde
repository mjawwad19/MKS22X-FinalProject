float YBound = pFieldTopY + 24*lh; //20 from just pfield but then another 4 because of the lowest a piece child is (rect)
PShape rotateLeft() {
  if (Possible() && collision()) {
    if (rotation == 0) rotation = maxRotations - 1;
    else rotation--; //to ensure looping back to the correct rotation index
  } else pieceLocked = true;
  return which();
}

PShape rotateRight() {
  if (Possible() && collision()) {
    if (rotation == maxRotations - 1) rotation = 0;
    else rotation++;
  } else pieceLocked = true;
  return which();
}

PShape moveDown() {
  if (Possible() && collision())
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

boolean collision() {
    return (pField[convertY(y1) +1][convertX(x1)].gColor() == black &&
    pField[convertY(y2)+1][convertX(x2)].gColor() == black &&
    pField[convertY(y3)+1][convertX(x3)].gColor() == black &&
    pField[convertY(y4)+1][convertX(x4)].gColor() == black);
}

void feed() {
  if (pieceLocked) {
    pField[convertY(ny1)][convertX(nx1)].cColor(c);
    pField[convertY(ny2)][convertX(nx2)].cColor(c);
    pField[convertY(ny3)][convertX(nx3)].cColor(c);
    pField[convertY(ny4)][convertX(nx4)].cColor(c);
  }
}