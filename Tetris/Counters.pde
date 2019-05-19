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
  text(String.format("%06d", score), width * (0.83), height * 0.25);
}

//Seems like this isn't even used, and yeah I know this isn't a counter
void playingFieldBox() {
  boxFormatting();
  rect(width * 0.50, height * 0.55, pFieldWidth, pFieldHeight); //looks closest to the actual game, by my eye
}
