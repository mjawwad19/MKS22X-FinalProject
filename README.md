# Classic Tetris in Processing
This is the final project of AP Computer Science for the term of Spring 2019, and is a faithful recreation of NES Tetris, done in Processing-Java. 

Authors: Momo Sapiens (you want your actual name here?) and Kevin Li

Classic Tetris is different from more modern Tetris versions in that the gameplay may look slow due to the fact that there is no instant drop-down, holding pieces, and multiple piece preview. It requires a different way of thinking - you must make sure you build your stack to accomodate any piece that may be thrown at you (all of the pieces are not guaranteed to be dropped at least once every 12 pieces like modern Tetris). At some point, the hardest part of the game may be your ability to move pieces fast enough to a desired location. 

## Development log

[Day 0] 5/17/19:
  - Jawwad created the repo and began the Block class.
  
[Day 1] 5/18/19:
  - Kevin created the playing field, score, and line boxes (using the NES font, can update itself as normally text stays on screen).
  - Kevin created PShapes for all 7 tetrominoes (colored appropriately). (He wanted to solo this)
  
  - Jawwad, after some experimenting with numbers, was able to create a double array of blocks centered on top of the playing field.
    - In the future, the piece lock feature will feed blocks into this array!
    
[Day 2] 5/19/19:
  - Jawwad after evaluating Kevin's changes, suggested a Piece interface (currently all the pieces are created OUTSIDE the piece class...)
  - Jawwad rescinds his comment, because PShapes are proving to be tricky with referencing. (Trying to randomly generate a piece instead of calling just one causes nullPointer...)
  - Jawwad experiments and pushes through PShape Hell and tries to get a working piece. big sad no workie.
  - all work and no play makes jawwad a crazy man.
  - Jawwad figured out an easier way to create the pieces using PShape and children --- in line with how the the grid and blocks are formatted.
