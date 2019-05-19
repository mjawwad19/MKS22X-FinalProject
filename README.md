# Classic Tetris in Processing
This is the final project of AP Computer Science for the term of Spring 2019, and is a faithful recreation of NES Tetris, done in Processing-Java. 

Classic Tetris is different from more modern Tetris versions in that the gameplay may look slow due to the fact that there is no instant drop-down, holding pieces, and multiple piece preview. It requires a different way of thinking - you must make sure you build your stack to accomodate any piece that may be thrown at you (all of the pieces are not guaranteed to be dropped at least once every 12 pieces like modern Tetris). At some point, the hardest part of the game may be your ability to move pieces fast enough to a desired location. 

## Development log

[Day 0] 5/17/19:
  - Jawwad created the repo and began the Block class.
  
[Day 1] 5/18/19:
  - Kevin created the playing field, score, and line boxes (using the NES font, can update itself as normally text stays on screen).
  - Kevin created PShapes for all 7 tetrominoes (colored appropriately). 
  
  - Jawwad, after some experimenting with numbers, was able to create a double array of blocks centered on top of the playing field.
    - In the future, the piece lock feature will feed blocks into this array!
