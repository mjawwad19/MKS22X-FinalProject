void tasksTiedToLevel() {
  if (frame % getSpeed() == 0) {
    currPiece = moveDown();

    //Choose a new piece
    if (pieceLocked && framesPieceLocked >= 15) {
      dx = 0; //reset back to the top of the screen
      dy = 0;
      curr = next;
      currPiece = determinePiece(curr);

      switch (t) {
      case 'I':
        ++Is;
        break;
      case 'J':
        ++Js;
        break;
      case 'L':
        ++Ls;
        break;
      case 'S':
        ++Ss;
        break;
      case 'Z':
        ++Zs;
        break;
      case 'O':
        ++Os;
        break;
      default: //T case
        ++Ts;
        break;
      }

      next = (int) random(7);
      rotation = 0;
      pieceLocked = false;
      framesPieceLocked = 0;
      score += clearLines();
    }
  }
}

//Returns how many frames it takes a piece to fall down 1 line (e.g. 48 on level 0)
int getSpeed() {
  switch (level) {
  case 0:
    return 48;
  case 1:
    return 43;
  case 2:
    return 38;
  case 3:
    return 33;
  case 4:
    return 28;
  case 5:
    return 23;
  case 6:
    return 18;
  case 7:
    return 13;
  case 8:
    return 8;
  case 9:
    return 6;
  case 10:
    return 5;
  case 11:
    return 5;
  case 12:
    return 5;
  case 13:
    return 4;
  case 14:
    return 4;
  case 15:
    return 4;
  case 16:
    return 3;
  case 17:
    return 3;
  case 18:
    return 3;
  case 19:
    return 2;
  case 20:
    return 2;
  case 21:
    return 2;
  case 22:
    return 2;
  case 23:
    return 2;
  case 24:
    return 2;
  case 25:
    return 2;
  case 26:
    return 2;
  case 27:
    return 2;
  case 28:
    return 2;
  default: //Level 29 and above: the kill screen
    return 1;
  }
}
