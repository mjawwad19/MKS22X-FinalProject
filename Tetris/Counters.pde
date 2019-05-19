void textFormatting() {
  textFont(font);
  textAlign(CENTER, CENTER);
  fill(255);
}

void frameCounter() { //top left
  textFormatting();
  text(String.format("%02d", frame % 60), 40, 30); //2 digits
}

void lineCounter() {
  textFormatting();
  text("LINES-" + String.format("%03d", lines % 240), width * 0.50, height * 0.10);
}

void scoreCounter() {
  textFormatting();
  text(String.format("%06d", score), width * (0.83), height * 0.25);
}
