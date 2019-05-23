# Classic Tetris in Processing
This is the final project of AP Computer Science for the term of Spring 2019, and is a faithful recreation of NES Tetris, done in Processing-Java.

Authors: Mohammad Jawwad (you want your actual name here?) and Kevin Li

Classic Tetris is different from more modern Tetris versions in that the gameplay may look slow due to the fact that there is no instant drop-down, holding pieces, and multiple piece preview. It requires a different way of thinking - you must make sure you build your stack to accommodate any piece that may be thrown at you (all of the pieces are not guaranteed to be dropped at least once every 12 pieces like modern Tetris). At some point, the hardest part of the game may be your ability to move pieces fast enough to a desired location.

## Development log

[Day 0] 5/17/19:
  - Jawwad created the repo and began the Block class.

[Day 1] 5/18/19:
  - Kevin created the playing field, score, and line boxes (using the NES font, can update itself as normally text stays on screen).
  - Kevin created PShapes for all 7 tetrominoes (colored appropriately). (He wanted to solo this)

  - Jawwad, after some experimenting with numbers, was able to create a double array of blocks centered on top of the playing field.
    - In the future, the piece lock feature will feed blocks into this array!

[Day 2] 5/19/19:
  - Jawwad considered making the individual pieces implement a piece class... but nah.
    - Jawwad experiments and pushes through PShape Hell and tries to get a working piece with movement, or just not moving when not allowed
    - all work and no play makes jawwad a crazy man.
  - Jawwad figured out an easier way to create the pieces using PShape and children --- in line with how the the grid and blocks are formatted.
    - This can be seen on the Experiments directory under EasyShapes: we will not be using it till we confirm for certain it can move and rotate correctly.
    - Huzzah Jawwad stayed up and figured out how to make rotate work:
      - hard code in x1, y1, x2, y2, x3, y3, x4, y4 for each rotation in a piece 'constructor'
      - make rotate return this constructor after modifying the rotation value
      - set currpiece = the result of rotate
      - button presses after that :p
  - Idea # 3: instead of using PShapes, why not make each individual piece a block array of 4 values? That way we can move and rotate by just updating the block's.x and y. And access them easily when we are locking. [Seriously this is such a simple way to do this why are we not doing it]

  - Kevin: Code reorganization


[Day 3] 5/20/19:
  - Kevin: trying to calm Jawwad down on his "I'm going to procrastinate on everything else in life and focus on CS" phase
    - found a way to not cause epilepsy when rotating a piece YAY
    - helped Jawwad find 3 crucial typos in his piece creation
    - was a great rubber ducky to Jawwad and found his stupid mistakes and bugs and oversights.
    - speed system demo: press the plus or minus keys to increase or decrease the levels which increase or decrease the speed of the pieces falling down respectively.

  - Jawwad: demoed in class to Mr.K/Kevin the rotation --- it's an epilepsy warning, as well as how to create individual pieces by children to Kevin
    - ported rotation (Right and Left) to his working branch!
    - fixed a rotation oversight that Kevin pointed out
    - ported ---spent the whole day drawing diagrams so he could figure out ALL of the x and y positions of each children of each rotation of each piece, and got them working and correct like a boss on his working branch!
    - added moving down/left/right (though without bounds) to his working branch
    - **Needs to calm the hell down jesus.**

[Day 4] 5/21/19:
  - merged all the movement stuff from Jawwad's branch in class
  - Kevin:
    -placed x bounds for pieces for moveleft and Right
    - keybindings (though these may be subject to change, Jawwad and Reddit thinks this ain't a great combo of keys)
    - level/speed increaser (this is just for visualization, in final version they will be impacted by score)
    - converting repetitive if else statements to switches
  - Jawwad:
    - fixed bug that caused J's to generate to Ls and Os to Ts
    - fixed bug where currPiece immediately converted to nextPiece after 1 moveDown (with the simplest dumbest way possible after long thought)
    - fixed bug where nextPiece generation happened 1 below where it should have (with the simplest dumbest way possible after long thought)
    - Fixed YBound restrictions on piece movement/rotation. This will be further expanded upon to check for any 'collision' with pieces already fed into the array.
    
[Day 5] 5/22/19:
  - Both:
    - debugging: print the grid 
    - debugging: print all relevant info (xcorrds, y coords, ny coords, nx coords)
  - Kevin:
    - added pauser (press enter) using loop and noLoop
    - conversion of x and y to array positions math
    - fixed bug that caused I's to be constructed like | instead of __
  - Jawwad:
    - dying sick :/ so working out math/ making Kevin do stuff via Driver/Mapper relationship
     - research on noLoop and loop for pause
    - cleaned up printing of the grid to be less jarring
    - fixed bug at one child of pshape not converting into the array.
    - [hopefully] fixed rotation left freeze bug when user rotates left too many times by changing rotation to a) 24 [multiple of 2, 4 and 1 maxRotations] and having the rotate functions store a local equivalent of rotation % maxRotation.
    
    Things to do now/Try to figure out:
      - lock a piece down by feeding into the array, and more importantly, keep it in the array.
        - currently the issue is that currPiece gets locked when YBound is hit, fed into the array, and then changes to nextPiece. But nextpiece is not locked so the feeding of the array is now lost.
     - "delete" a row/line and shift everything above it down
      - score update when this happens
      - display Next piece in box 
