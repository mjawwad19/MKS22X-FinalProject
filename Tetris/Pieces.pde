PShape IPiece, OPiece, JPiece, LPiece, SPiece, ZPiece, TPiece;

void createPieces() {
  //Create I piece shape
  IPiece = createShape();
  IPiece.beginShape();
  IPiece.fill(IPieceTurqoise);
  IPiece.vertex(0, 0);
  IPiece.vertex(0, lineHeight * 4);
  IPiece.vertex(lineHeight, lineHeight * 4);
  IPiece.vertex(lineHeight, 0);
  IPiece.endShape(CLOSE);
}

class Pieces {
  PShape piece;
  int rotation = 0; //in degrees
  
  void rotateLeft() {
    
  }
  
  void rotateRight() {
    
  }
  
  void forceDown() {
    
  }
  
  void moveLeft() {
    
  }
  
  void moveRight() {
    
  }
  
  void lock() {
    
  }
}
