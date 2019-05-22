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

void frameCounter() { //top left
  textFormatting();
  text(String.format("%02d", frame % 60), 40, 30); //2 digits
}

void lineCounter() {
  boxFormatting();
  rect(width * 0.50, height * 0.10, pFieldWidth, height * 0.10);

  textFormatting();
  text("LINES-" + String.format("%03d", lines % 240), width * 0.50, height * 0.10);
}

void scoreCounter() {
  boxFormatting();
  rect(width * 0.83, height * 0.20, width * 0.20, width * 0.16);

  textFormatting();
  text("SCORE", width * 0.83, height * 0.16);
  text(String.format("%06d", score), width * 0.83, height * 0.25);
}

void nextPieceCounter() {
  boxFormatting();
  rect(width * 0.805, height * 0.43, width * 0.15, height * 0.20);

  textFormatting();
  text("NEXT", width * 0.805, height * 0.39);
}

void levelCounter() {
  boxFormatting();
  rect(width * 0.82, height * 0.62, width * 0.18, height * 0.12);

  textFormatting();
  text("LEVEL", width * 0.82, height * 0.60);
  text(String.format("%02d", level), width * 0.83, height * 0.65);
}

void debug() {
  //boxFormatting();
  //rect(width * 0.20, height * 0.50, width * 0.18, height * 0.12);

  textFormatting();
  text("x1: " + x1, width * 0.20, height * 0.05);
  text("y1: " + y1, width * 0.20, height * 0.10);
  text("x2: " + x2, width * 0.20, height * 0.15);
  text("y2: " + y2, width * 0.20, height * 0.20);
  text("x3: " + x3, width * 0.20, height * 0.25);
  text("y3: " + y3, width * 0.20, height * 0.30);
  text("x4: " + x4, width * 0.20, height * 0.35);
  text("y4: " + y4, width * 0.20, height * 0.40);
  text("nx1 :" + nx1, width * 0.20, height * 0.45);
  text("ny1 :" + ny1, width * 0.20, height * 0.50);
  text("nx2 :" + nx2, width * 0.20, height * 0.55);
  text("ny2 :" + ny2, width * 0.20, height * 0.60);
  text("nx3 :" + nx3, width * 0.20, height * 0.65);
  text("ny3 :" + ny3, width * 0.20, height * 0.70);
  text("nx4 :" + nx4, width * 0.20, height * 0.75);
  text("ny4 :" + ny4, width * 0.20, height * 0.80);
}

//Seems like this isn't even used, and yeah I know this isn't a counter
void playingFieldBox() {
  boxFormatting();
  rect(width * 0.50, height * 0.55, pFieldWidth, pFieldHeight); //looks closest to the actual game, by my eye
}
