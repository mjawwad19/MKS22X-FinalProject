int piece;
  int rotation = 0; //in degrees
  //by default we want the y's to be at the top of the board and nowhere else!
  //by default we want the x's to be at the left most place on the board and grid!
  float x1 = pFieldWidth * 1.275 + lineHeight/2;
  float x2 = pFieldWidth * 1.275 + lineHeight/2;
  float x3 = pFieldWidth * 1.275 + lineHeight/2;
  float x4 = pFieldWidth * 1.275 + lineHeight/2;
  float y1 = height * 0.190 + lineHeight/2;
  float y2 = height * 0.190 + lineHeight/2;
  float y3 = height * 0.190 + lineHeight/2;
  float y4 = height * 0.190 + lineHeight/2;
  //these are the right left up down bounds that limit the places a piece can be
  float xBound0 = pFieldWidth * 1.275 + lineHeight/2;
  float yBound0 = pFieldWidth * 1.275 + lineHeight/2;
  float xBound1 = pFieldWidth * 1.275 + lineHeight/2 + lineHeight*9;
  float yBound1 = pFieldWidth * 1.275 + lineHeight/2 + lineHeight*19;

  Pieces() {
    //piece = (int) random(7);
    if (piece == 0) {
      //createI();
      x1 += lineHeight*4; //center of the board
      x2 += lineHeight*4;
      x3 += lineHeight*4;
      x4 += lineHeight*4;
      //y1 += lineHeight; 
      y2 += lineHeight;
      y3 += lineHeight*2;
      y4 += lineHeight*3;
    } else if (piece == 1) {
      //createO();
      x1+= lineHeight*4; //center of the board
      x2 += lineHeight*5;
      x3 +=lineHeight*4;
      x4 += lineHeight*5;
      y3 += lineHeight;
      y4 += lineHeight;
    } else if (piece == 2) {
      //createJ();
      x1 += lineHeight*4; //center of the board
      x2 += lineHeight*4;
      x3 += lineHeight*4;
      x4 += lineHeight*3; 
      y2 += lineHeight;
      y3 += lineHeight*2;
      y4 += lineHeight*2;
    } else if (piece == 3) {
      //createL();
      x1 += lineHeight*4; //center of the board
      x2 += lineHeight*4;
      x3 += lineHeight*4;
      x4 += lineHeight*5; 
      y2 += lineHeight;
      y3 += lineHeight*2;
      y4 += lineHeight*2;
    } else if (piece == 4) {
      //createS();
      x1 += lineHeight*4; //center of the board
      x2 += lineHeight*3;
      x3 += lineHeight*3;
      x4 += lineHeight*2;
      y3 += lineHeight;
      y4 += lineHeight;
    } else if (piece == 5) {
      //createZ();
      x1 += lineHeight*4; //center of the board
      x2 += lineHeight*5;
      x3 += lineHeight*5;
      x4 += lineHeight*6;
      y3 += lineHeight;
      y4 += lineHeight;
    } else {
      createT();
      x1 += lineHeight*3;
      x2 += lineHeight*4;
      x3 += lineHeight*5;
      x4 += lineHeight*4;
      y4 += lineHeight;
    }
  }
  void rotator(int d) {
    pushMatrix();
    translate((x2 + x3)/2, (y2 + y3)/2);
    rotate(radians(d));
    popMatrix();
  }

  void rotateLeft() {
    rotation -= 90;
    rotator(rotation);
  }

  void rotateRight() {
    rotation += 90;
    rotator(rotation);
  }

  void forceDown() {
  }

  //checks to see if piece can move right
  boolean mableR() {
    return ( x1 >= xBound0 && x1 < xBound1 &&
      x2 >= xBound0 && x2 < xBound1 &&
      x3 >= xBound0 && x3 < xBound1 &&
      x4 >= xBound0 && x4 < xBound1 &&
      y1 >= yBound0 && y1 < yBound1 &&
      y2 >= yBound0 && y2 < yBound1 &&
      y3 >= yBound0 && y3 < yBound1 &&
      y4 >= yBound0 && y4 < yBound1
      );
  }

  boolean mableL() {
    return ( x1 > xBound0 && x1 <= xBound1 &&
      x2 > xBound0 && x2 <= xBound1 &&
      x3 > xBound0 && x3 <= xBound1 &&
      x4 > xBound0 && x4 <= xBound1 &&
      y1 >= yBound0 && y1 < yBound1 &&
      y2 >= yBound0 && y2 < yBound1 &&
      y3 >= yBound0 && y3 < yBound1 &&
      y4 >= yBound0 && y4 < yBound1
      );
  }

  void moveLeft() {
    if (mableL()) {
      x1-= lineHeight;
      x2-= lineHeight;
      x3-= lineHeight;
      x4-= lineHeight;
    }
  }

  void moveRight() {
    if (mableR()) {
      x1+= lineHeight;
      x2+= lineHeight;
      x3+= lineHeight;
      x4+= lineHeight;
    }
  }


  int coordX(float xpos) {
    return (int) (((xpos - (pFieldWidth * 1.275) - lineHeight/2)/lineHeight));
  }

  int coordY(float ypos) {
    return (int) (((ypos - (height * .190) - lineHeight/2)/lineHeight));
  }

  void lock() {
    color bc;
    if (piece == 0) bc = IPieceTurqoise;
    else if (piece ==1) bc = OPieceYellow;
    else if (piece ==2) bc = JPieceBlue;
    else if (piece == 3) bc = LPieceOrange;
    else if (piece == 4) bc = SPieceGreen;
    else if (piece == 5) bc = ZPieceRed;
    else bc = TPiecePurple;
    if (y1 == yBound1 || y2 == yBound1 || y3 == yBound1 || y4 == yBound1) {
      pField[coordY(y1)][coordX(x1)].cColor(bc);
      pField[coordY(y2)][coordX(x2)].cColor(bc);
      pField[coordY(y3)][coordX(x3)].cColor(bc);
      pField[coordY(y4)][coordX(x4)].cColor(bc);
    }
  }
  
  PShape getP() {
    if (piece == 0) return IPiece;
    else if (piece ==1 ) return OPiece;
    else if (piece ==2) return JPiece;
    else if (piece ==3) return LPiece;
    else if (piece == 4) return SPiece;
    else if (piece == 5) return ZPiece;
    else return TPiece;
  }
