# Classic Tetris in Processing
This is the final project of AP Computer Science for the term of Spring 2019, and is a faithful recreation of NES Tetris, done in Processing-Java.

Authors: Mohammad Jawwad and Kevin Li

Classic Tetris is different from more modern Tetris versions in that the gameplay may look slow due to the fact that there is no instant drop-down, holding pieces, and multiple piece preview. It requires a different way of thinking - you must make sure you build your stack to accommodate any piece that may be thrown at you (all of the pieces are not guaranteed to be dropped at least once every 12 pieces like modern Tetris). At some point, the hardest part of the game may be your ability to move pieces fast enough to a desired location.

## Development log

[Day 0] 5/17/19:
  - Jawwad created the repo and began the Block class.
    - x, y, color, accessor, and mutator methods for color.

[Day 1] 5/18/19:
  - Kevin created the playing field, score, and line boxes (using the NES font, can update itself as normally text stays on screen).
  - Kevin created PShapes for all 7 tetrominoes (colored appropriately). (He wanted to solo this) using vertices.

  - Jawwad, after some experimenting with numbers, was able to create a double array of blocks centered on top of the playing field.
    - In the future, the piece lock feature will feed blocks into this array!

[Day 2] 5/19/19:
  - Jawwad considered making the individual pieces implement a Piece class...but nah. Proved harder than it was worth.
    - Jawwad experiments and pushes through PShape hell and tries to get a working piece with movement, or just not moving when not allowed
    - All work and no play makes Jawwad a crazy man.
  - Jawwad figured out an easier way to create the pieces using PShape and children, in line with how the the grid and blocks are formatted.
    - This can be seen in the Experiments directory under EasyShapes: we will not be using it till we confirm for certain it can move and rotate correctly.
    - Huzzah Jawwad stayed up and figured out how to make rotate work:
      - hard code in x1, y1, x2, y2, x3, y3, x4, y4 for each rotation in a piece 'constructor'
      - make rotate return this constructor after modifying the rotation value
      - set currPiece to the result of rotate
      - button presses after that :p
  - Idea # 3: instead of using PShapes, why not make each individual piece a block array of 4 values? That way we can move and rotate by just updating the block's x and y values. And access them easily when we are locking. [Seriously this is such a simple way to do this why are we not doing it]

  - Kevin: Code reorganization, removed black rectangle underneath pField because not needed, level system (can play with speeds using levels)


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
  - mMrged all the movement stuff from Jawwad's branch in class
  - Kevin:
    -placed x bounds for pieces for moveleft and Right
    - keybindings (though these may be subject to change, Jawwad and Reddit thinks this ain't a great combo of keys)
    - level/speed increaser (this is just for visualization, in final version they will be impacted by score)
    - converting repetitive if else statements to switches
  - Jawwad:
    - fixed bug that caused J's to generate to Ls and Os to Ts ---typos from Kevin reorganizing switch statements
    - fixed bug where currPiece immediately converted to nextPiece after 1 moveDown (with the simplest dumbest way possible after long thought
      - have currPiece and 1st nextPiece be the same so immediate conversion won't change the shape! Then nextPiece updates as it randomly should
    - fixed bug where nextPiece generation happened 1 below where it should have (with the simplest dumbest way possible after long thought)
      - this was fixed by setting dy to -1 instead of 0.
    - Fixed YBound restrictions on piece movement/rotation. This will be further expanded upon to check for any 'collision' with pieces already fed into the array

[Day 5] 5/22/19:
  - Both:
    - debugging: print the grid
    - debugging: print all relevant info (xcorrds, y coords, ny coords, nx coords)
  - Kevin:
    - added pause function (press enter) using loop and noLoop
    - conversion of x and y to array positions math
    - fixed bug that caused I's to be constructed like | instead of __
  - Jawwad:
    - dying sick :/ so working out math/ making Kevin do stuff via Driver/Mapper relationship
     - research on noLoop and loop for pause
    - cleaned up printing of the grid to be less jarring to look at (don't display black!)
    - fixed bug at one child of pshape not converting into the array.
      - the usage of ncoor vs coor is crucial here as some children will not show when rotated because they aren't updated in time
    - [hopefully] fixed rotation left freeze bug when user rotates left too many times
      - by changing rotation to 24 [multiple of 2, 4 and 1 maxRotations]
      - having the rotate functions store a local equivalent of rotation % maxRotation.

    Things to do now/Try to figure out:
      - lock a piece down by feeding into the array, and more importantly, keep it in the array.
        - currently the issue is that currPiece gets locked when YBound is hit, fed into the array, and then changes to nextPiece. But nextpiece is not locked so the feeding of the array is now lost.
     - "delete" a row/line and shift everything above it down
      - score update when this happens
      - display Next piece in box


 [Day 6] 5/23/19
  - Jawwad:
    - made a rudimentary lock that needs to be improved upon
        - only works on the bottom layer and semi works on top of other pieces:
        - Issue #0: calling moveDown() manually by the S Key on a piece right above any Y bound/collision will cause the piece to not get locked at all, but instead generate the next piece.
          - we want it to lock regardless if moveDown() is also called manually.
        - Issue #1: a piece may be able to rotate outside of the grid by x/when it is not rotated, is bound 1 away from the edges of the grid.
          - specifically piece I on the left side for rotation.
          - In both the right and left, I isn't able to be at the rightmost or left most edge when in | rotation. O is not allowed either. Neighter is Z when upright, J upright, L upright etc. This may have to do with using dx/dy when we should be using convertX/convertY
          - The intended behavior is to not allow rotation at all at these areas if the piece will be outside the board, but also to allow a piece to move as far right/left as possible in it's current rotation;
        - Issue #2: similar to Issue #1, a piece may rotate last second onTOP of a piece that has been locked in place, instead of restricting that rotation.
        - Issue #3: similar to Issue #3 and #0, a piece rotating last second may also cause the piece to generate the next piece without locking.
        - freaks out if the top is reached/ 1 away from the top because the piece locks and immediately generates out.
        -we need to code in a game over when this occurs to prevent this.
  - Kevin:
    - separated displaying/construction of field to keep a locked piece in the field instead of redrawing a clean board every frame. This allows locking to feed into the field array and be saved.
    
 [Day 8] 5/25/19
 - Kevin:
    - Implemented fluid movement so that movement registers the frame after a key is registered (overhauled key handling per Mr. K's suggestions in class), includes forcing down a piece and rotations
    - Implemented the DAS movement style down to the frame
    - Next piece counter now works
    - Fixed a bug where the rotation saved so that a new block spawned isn't in the default rotation
    - Piece lock delay to mimic NES Tetris (this could be causing an issue with pieces being fed in multiple times, not sure yet)
    - A game over ANIMATION
 - Jawwad is still sick but doesn't want to be complacent
    - trying to figure out why edge rotation won't work
      - crazy idea but what if we make the grid 12 by 20 but only have the center 10 be black? That should allow rotation at the "edges"
    - Fixed centered rotation for S/Z/L pieces after Kevin gave classic NES Tetris videos showing that our hardcoded rotations were shifted down or to the right when they shouldn't have been
  - Bug fixes + new bugs:
    - moveDown() not locking is over
    - fast last minute changes can cause multiple locks
      - at least the piece is guaranteed to lock tho so Issue # 3 of day 6 is now something less worse?
    - still edge rotation doesn't work

[Day 9] 5/26/19
- Kevin:
    - Fixed the bug where a locked piece gets fed into the array multiple times
    - Code cleanup
- Jawwad:
    - went to experimental with a copy of Tetris now named Rotation_Bounds
      - tried to figure out a way to make rotations work on edges
        - success! sorta... See  [Experiments](Experiments/Experiments.md) for more details
