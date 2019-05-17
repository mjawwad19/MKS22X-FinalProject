public class Block {
  int x, y;
  color c;
  Block(int posX, int posY, int R, int G, int B) {
    x = posX;
    y = posY;
    c = color(R,G,B);
    rectMode(CENTER);
    fill(c);
    rect(x,y,10,10);
  }
}