void textFormatting() {
  textFont(font);
  textAlign(CENTER, CENTER);
  fill(255);
}

void frameCounter() { //top left
  //To clear text
  fill(64, 67, 71);  //gray
  stroke(64, 67, 71);
  rect(40, 30, 60, 60);
  
  textFormatting();
  text(String.format("%02d", frame % 60), 40, 30); //2 digits
}

void lineCounter() {
  //To clear text
  fill(0);
  stroke(0);
  rect(width * 0.50, height * 0.10, width * 0.33 - 10, height * 0.10 - 10);
  
  textFormatting();
  text("LINES-" + String.format("%03d", lines % 240), width * 0.50, height * 0.10);
}

void scoreCounter() {
  //To clear text
  fill(0);
  stroke(0);
  rect(width * 0.83, height * 0.25, width * 0.20 - 10, height * 0.10 - 10);
  
  textFormatting();
  text(String.format("%06d", score), width * (0.83), height * 0.25);
}
