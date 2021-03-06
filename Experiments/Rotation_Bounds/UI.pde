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

    default: //every other piece
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
