class Block {
  float x, y;
  color c;

  Block(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  void display() {
    rectMode(CENTER);
    fill(c);
    stroke(0);
    rect(x, y, lh, lh);
  }

  color getColor() {
    return this.c;
  }

  void setColor(color c) {
    this.c = c;
  }
}
