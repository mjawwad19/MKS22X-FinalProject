class Block {
  float x,y;
  color c;

  Block(float posX, float posY, int r, int g, int b) {
    x = posX;
    y = posY;
    c = color(r, g, b);
  }

  void display() {
    rectMode(CENTER);
    fill(c);

    //It looks better blending in imo - Kevin
    stroke(0); //border
    rect(x, y, lh, lh);
  }

  color gColor() {
    return this.c;
  }

  //changes color to black. Useful for "deleting" a block
  void cColor() {
    this.c = color(0,0,0);
  }
}
