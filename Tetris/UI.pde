//For statistics
int Ts, Js, Zs, Os, Ss, Ls, Is = 0;

void textFormatting() {
  textFont(font);
  textAlign(CENTER, CENTER);
  fill(255);
}

void boxFormatting() {
  fill(0);
  rectMode(CENTER);
  stroke(255); // white borders
  strokeWeight(2);
}

//Really only useful for debugging purposes
void frameCounter() { //top left
  textFormatting();
  text(String.format("%02d", frame % 60), 40, 30); //2 digits
}

void lineCounter() {
  boxFormatting();
  rect(width * 0.50, height * 0.10, pFieldWidth, height * 0.10);

  textFormatting();
  text("LINES-" + String.format("%03d", lines), width * 0.50, height * 0.10);
}

void scoreCounter() {
  boxFormatting();
  rect(width * 0.83, height * 0.20, width * 0.20, width * 0.16);

  textFormatting();
  text("SCORE", width * 0.83, height * 0.16);
  text(String.format("%06d", score), width * 0.83, height * 0.25);
}

void nextPieceBox() {
  boxFormatting();
  rect(width * 0.805, height * 0.43, width * 0.15, height * 0.20);

  textFormatting();
  text("NEXT", width * 0.805, height * 0.38);

  //Need those edge cases as they don't fit as snugly into the next box
  switch (next) {
  case 0: //I piece
    shape(getPieceGraphic(next), width * 0.748, height * 0.44);
    break;

  case 1: //O piece
    shape(getPieceGraphic(next), width * 0.777, height * 0.425);
    break;

  default: //every ottrueher piece
    shape(getPieceGraphic(next), width * 0.762, height * 0.425);
    break;
  }
}

void levelCounter() {
  boxFormatting();
  rect(width * 0.82, height * 0.62, width * 0.18, height * 0.12);

  textFormatting();
  text("LEVEL", width * 0.82, height * 0.60);
  text(String.format("%02d", level), width * 0.83, height * 0.65);
}

void statistics() {
  boxFormatting();
  rect(width * 0.175, height * 0.59, width * 0.25, pFieldHeight * 0.95);

  textFormatting();
  textFont(smallFont);
  text("STATISTICS", width * 0.175, height * 0.28);
  shape(TPiece, width * 0.06, height * 0.33);
  shape(JPiece, width * 0.06, height * 0.33 + 2.5 * lh);
  shape(ZPiece, width * 0.06, height * 0.33 + 5 * lh);
  shape(OPiece, width * 0.06, height * 0.33 + 7.5 * lh);
  shape(SPiece, width * 0.06, height * 0.33 + 10 * lh);
  shape(LPiece, width * 0.06, height * 0.33 + 12.5 * lh);
  shape(IPiece, width * 0.06, height * 0.33 + 15 * lh);

  fill(ZPieceRed);
  text(String.format("%03d", Ts), width * 0.22, height * 0.36);
  text(String.format("%03d", Js), width * 0.22, height * 0.36 + 2.5 * lh);
  text(String.format("%03d", Zs), width * 0.22, height * 0.36 + 5 * lh);
  text(String.format("%03d", Os), width * 0.22, height * 0.36 + 7.5 * lh);
  text(String.format("%03d", Ss), width * 0.22, height * 0.36 + 10 * lh);
  text(String.format("%03d", Ls), width * 0.22, height * 0.36 + 12.5 * lh);
  text(String.format("%03d", Is), width * 0.22, height * 0.36 + 15 * lh);
}

void musics() {
  textFormatting();
  //textFont(smallFont);
  if (indexM == 0) {
    fill(choiceC);
    text("MUSIC - 1", width * .57, height * .6);
    fill(white);
  } else   text("MUSIC - 1", width * .57, height * .6);
  if (indexM == 1) {
    fill(choiceC);
    text("MUSIC - 2", width * .57, height * .7);
    fill(white);
  } else text("MUSIC - 2", width * .57, height * .7);
  if (indexM == 2) {
    fill(choiceC); 
    text("MUSIC - 3", width * .57, height * .8);
    fill(white);
  } else text("MUSIC - 3", width * .57, height * .8);
  if (indexM == 3) {
    fill(choiceC);
    text("OFF", width * .585, height * .87);
    fill(white);
  } else text("OFF", width * .585, height * .87);
}

void debug() {
  textFormatting();
  text("x1: " + x1, width * 0.18, height * 0.10);
  text("y1: " + y1, width * 0.18, height * 0.15);
  text("x2: " + x2, width * 0.18, height * 0.20);
  text("y2: " + y2, width * 0.18, height * 0.25);
  text("x3: " + x3, width * 0.18, height * 0.30);
  text("y3: " + y3, width * 0.18, height * 0.35);
  text("x4: " + x4, width * 0.18, height * 0.40);
  text("y4: " + y4, width * 0.18, height * 0.45);
  text("nx1 :" + nx1, width * 0.18, height * 0.50);
  text("ny1 :" + ny1, width * 0.18, height * 0.55);
  text("nx2 :" + nx2, width * 0.18, height * 0.60);
  text("ny2 :" + ny2, width * 0.18, height * 0.65);
  text("nx3 :" + nx3, width * 0.18, height * 0.70);
  text("ny3 :" + ny3, width * 0.18, height * 0.75);
  text("nx4 :" + nx4, width * 0.18, height * 0.80);
  text("ny4 :" + ny4, width * 0.18, height * 0.85);
}
