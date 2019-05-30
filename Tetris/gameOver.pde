boolean gameOver = false;
color[] barColors = {ZPieceRed, white, JPieceBlue};
int framesAfterLoss = 0;
int colorIdx = 0;
float yPos = 150.3 - 10; //pFieldTopY - 10

void drawLastFrame() {
  background(backgroundGray);
  displayField();
  lineCounter();
  scoreCounter();
  nextPieceBox();
  levelCounter();
  bgMusic.stop();
}

void lossAnimation() {
  if (framesAfterLoss % 3 == 0 && framesAfterLoss < 183) { //61 bars
    rectMode(CENTER);
    fill(barColors[colorIdx % 3]);
    stroke(barColors[colorIdx % 3]);
    rect(pFieldTopX - 13.7, yPos, pFieldWidth, lh/3);
    ++colorIdx;
    yPos += lh/3;
  }
}
