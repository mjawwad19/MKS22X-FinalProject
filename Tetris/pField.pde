Block[][] pField = new Block[20][10];
PShape currPiece;
int curr = (int) random(7); //indices for the pieces to generate
int next = (int) random(7);
boolean pieceLocked = false;
int framesPieceLocked = 0;

//Useful constants
float lh = 27.0; //lh = line height
float pFieldWidth = lh * 10;
float pFieldHeight = lh * 20;
float pFieldTopX = 492.75;
float pFieldTopY = 150.3;

int convertX(float xpos) {
  return (int) ((xpos - 350) / 27);
}

int convertY(float ypos) {
  return (int) ((ypos - 150) / 27);
}

PShape determinePiece(int idx) {
  switch (idx) {
    case 0: return createI(0);
    case 1: return createO(); //square can't rotate so no point
    case 2: return createJ(0);
    case 3: return createL(0);
    case 4: return createS(0);
    case 5: return createZ(0);
    default: return createT(0); //case 6: the T piece
  }
}

//Creates a blank board
void setField() {
  float xB = pFieldWidth/20;
  float yB = pFieldHeight/40;

  //Draw the empty playing field (everything is a block)
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c] = new Block(xB, yB, black);
      xB += pFieldWidth/10;
    }

    xB = pFieldWidth/20;
    yB += pFieldHeight/20;
  }
}

void displayField() {
  //Fill in the empty blocks with their actual values
  pushMatrix();

  translate(pFieldWidth * 1.275, height * 0.190);
  for (int r = 0; r < 20; r++) {
    for (int c = 0; c < 10; c++) {
      pField[r][c].display();
    }
  }

  popMatrix();
}

//Simultaneously clears lines and scores
int clearLines() {
  ArrayList<Integer> linesToClear = new ArrayList<Integer>();

  for (int i = 0; i < 20; ++i) {
    boolean fullLine = true;
    for (int j = 0; j < 10; ++j) {
      if (pField[i][j].getColor() == black)
        fullLine = false;

    }

    if (fullLine)
      linesToClear.add(i);
  }

  Collections.sort(linesToClear);

  for (int i = 0; i < 20; ++i) {
    for (Integer line : linesToClear) {
      if (line.intValue() == i) {
        for (int j = 0; j < 10; ++j)
          pField[i][j].setColor(black);
      }
    }
  }


  for (Integer line: linesToClear) {
    for (int i = line.intValue(); i > 0; --i) {
      for (int j = 0; j < 10; ++j) {
        pField[i][j].setColor(pField[i - 1][j].getColor());
        pField[i - 1][j].setColor(black);
      }
    }
  }

  int clearedLines = linesToClear.size();
  if (transitioned) {
    if (lines / 10 < (lines + clearedLines) / 10) //logic checks that the second digit of a number has increased
      ++level;
  }

  lines += clearedLines;

  switch (clearedLines) {
    case 1: return 40 * (level + 1);
    case 2: return 100 * (level + 1);
    case 3: return 300 * (level + 1);
    case 4: return 1200 * (level + 1);
    default:
      lockSound.play();
      return 0; //case where 0 lines are cleared
  }
}

//For debugging purposes
String printPFieldColors() {
  String output = "";
  for (int i = 0; i < 20; ++i) {
    for (int j = 0; j < 10; ++j) {
      if (pField[i][j].getColor() == IPieceTurqoise)
        output += "Turq ";

      else if (pField[i][j].getColor() == OPieceYellow) {
        output += "Yell ";
      }

      else if (pField[i][j].getColor() == JPieceBlue) {
        output += "Blue ";
      }

      else if (pField[i][j].getColor() == LPieceOrange) {
        output += "Oran ";
      }

      else if (pField[i][j].getColor() == SPieceGreen) {
        output += "Gree ";

      }

      else if (pField[i][j].getColor() == ZPieceRed) {
        output += "Redd ";
      }

      else if (pField[i][j].getColor() == TPiecePurple) {
        output += "Purp ";
      }

      else
        output += "____ ";
    }

    output += "\n";
  }

  return output;
}
