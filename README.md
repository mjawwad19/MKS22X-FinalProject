# Classic Tetris in Processing
This is the final project of AP Computer Science for the term of Spring 2019, and is a faithful recreation of NES Tetris, done in Processing-Java.

Authors: Mohammad Jawwad and Kevin Li

Classic Tetris is different from more modern Tetris versions in that the gameplay may look slow due to the fact that there is no instant drop-down, holding pieces, and multiple piece preview. It requires a different way of thinking - you must make sure you build your stack to accommodate any piece that may be thrown at you (all of the pieces are not guaranteed to be dropped at least once every 12 pieces like modern Tetris). At some point, the hardest part of the game may be your ability to move pieces fast enough to a desired location.

## How to run
- Clone this repo somewhere. 
- Open Tetris.pde in Processing. 
- The Sound library is required. Go to Sketch (on the top bar in Processing) > Import Library > Add Library... > Search "sound" > Install "Sound" by the Processing Foundation
- Click run. ??? Profit/enjoy!

## Controls
On the main menu:
- W/S: cycle through music
- W/S/A/D: cycle through levels
- Progress from one screen to the next with ENTER (prominently displayed in-game)
- H: Go back to previous startup screen

In-game:
- A/D: move the piece left and right. If you wish, you can also hold down those keys for pieces to automatically move (DAS) - you do not have to tap multiple times. 
- S: force down a piece if you prefer playing fast (reminder, there is no instant drop-down)
- H: rotate a piece counterclockwise
- J: rotate a piece clockwise
- Enter: pause the game
- Just for show: pressing the + and - keys will increase or decrease the level/speed of the game in-game. 
```diff
- You normally cannot do this. 
```

## Working features
   - Choose music (or none at all)
   - Choose level to start on: 0-19 to mimic NES Tetris. A level calculator is used so that starting on a high level is not punished (e.g. you wouldn't want to go to from level 18 to 19 in just 10 lines while someone who starts on level 0 takes 190 lines). 
   - The first piece is frozen at the top of the screen so that the user can get their bearings. 
   - Statistics keep track of how many of each type of piece have been dropped. 
   - RNG: it is unforgiving and will not cycle through every single piece every 12 lines like Modern Tetris versions. You deal with what you get and build accordingly so that the RNG does not screw you over. 
   - Line, score, and level counters. Obviously, the more lines cleared at once, the more points you earn. Since you cannot (feasibly) play on level 29 and above, you have to make the most of your lines. 
   - Next piece box
   - Piece rotations using the right-handed rotation system used in NES Tetris 
   - Line clearing (1, 2, 3 at once, or a tetris)
   - Bounds for the allowed movements. We chose to restrict movement rather than keep movements open to prevent illegal movements. 
   - Pieces fall down the screen but gets "fed" into a 2D array of Block objects, from which calculations can be done via index instead of x and y. 
   - Speed system of the game is dependent on how many frames it takes for a piece to fall one line. On level 0 a piece takes 48 frames to fall down 1 line, which equates to something like 18 seconds to fall completely down the screen. On level 19 a piece takes 2 frames to fall 1 line, which equates to two-thirds of a second to fall completely down the screen. 
   - Movement: you can choose to either tap A and D repeatedly or rely on DAS: delayed auto-shift. It is the same phenomenon as when you try typing a letter repeatedly like "aaaaaaaaaa". You don't spam A presses, you hold A down. The first "a" appears on screen instantly, while there is a relatively long delay until the next "a" appears, and the rest of the "a"s are typed at a fast and consistent speed. This delay is required so that you don't accidentally make multiple movements when you only intended to do one. 
   - There is a game over screen/animation mimicking NES Tetris as well.
   - Sound effects are strewn all over the game. 
   - Some keys are locked after pressing them: you aren't meant to hold them down (like rotate and selecting a level to play on).

## Development log

[Day 0] 5/17/19:
- Jawwad:
   - created the repo and began the Block class.
   - x, y, color, accessor, and mutator methods for color.
    
_____

[Day 1] 5/18/19:
- Kevin:
    - created the playing field, score, and line boxes (using the NES font, can update itself as normally text stays on screen).
    - created PShapes for all 7 tetrominoes (colored appropriately). (He wanted to solo this) using vertices.
- Jawwad:
    - after some experimenting with numbers, was able to create a ***double array*** of blocks centered on top of the playing field.
      - In the future, the piece lock feature will feed blocks into this array!

_____

[Day 2] 5/19/19:
- Jawwad:
    - considered making the individual pieces implement a Piece class...but nah. Proved harder than it was worth.
    - experimented and pushed through PShape hell and tried to get a working piece with movement, or just not moving when not allowed
    - All work and no play makes Jawwad a crazy man.
    - figured out an easier way to create the pieces using PShape and children, in line with how the the grid and blocks are formatted.
      - This can be seen in the Experiments directory under EasyShapes: we will not be using it till we confirm for certain it can move and rotate correctly.
    - Huzzah figured out how to make rotate work:
      - hard code in x1, y1, x2, y2, x3, y3, x4, y4 for each rotation in a piece 'constructor'
      - make rotate return this constructor after modifying the rotation value
      - set currPiece to the result of rotate
      - button presses after that :p
   - Idea # 3: instead of using PShapes, why not make each individual piece a block array of 4 values? That way we can move and rotate by just updating the block's x and y values. And access them easily when we are locking. [Seriously this is such a simple way to do this why are we not doing it]
- Kevin: 
    - Code reorganization, removed black rectangle underneath pField because not needed
    - level system (can play with speeds using levels)

_____

[Day 3] 5/20/19:
- Kevin: trying to calm Jawwad down on his "I'm going to procrastinate on everything else in life and focus on CS" phase:
    - found a way to not cause epilepsy when rotating a piece YAY
    - helped Jawwad find 3 crucial typos in his piece creation
    - was a great rubber ducky to Jawwad and found his stupid mistakes and bugs and oversights.
    - speed system demo: press the plus or minus keys to increase or decrease the levels which increase or decrease the speed of the pieces falling down respectively.
- Jawwad: 
    - demoed in class to Mr.K/Kevin the rotation --- it's an epilepsy warning, as well as how to create individual pieces by children to Kevin
    - ported rotation (Right and Left) to his working branch!
    - fixed a rotation oversight that Kevin pointed out
    - ported ---spent the whole day drawing diagrams so he could figure out ALL of the x and y positions of each children of each rotation of each piece, and got them working and correct like a boss on his working branch!
    - added moving down/left/right (though without bounds) to his working branch
    - **Needs to calm the hell down jesus.**

_____

[Day 4] 5/21/19:
- Merged all the movement stuff from Jawwad's branch in class
- Kevin:
    - placed x bounds for pieces for moveleft and Right
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

_____

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
- Things to do now/Try to figure out:
    - lock a piece down by feeding into the array, and more importantly, keep it in the array.
        - currently the issue is that currPiece gets locked when YBound is hit, fed into the array, and then changes to nextPiece. But nextpiece is not locked so the feeding of the array is now lost.
    - "delete" a row/line and shift everything above it down
      - score update when this happens
    - display Next piece in box

_____

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
    
_____
    
[Day 8] 5/25/19
- Kevin:
    - Implemented fluid movement so that movement registers the frame after a key is registered (overhauled key handling per Mr. K's suggestions in class), includes forcing down a piece and rotations
    - Implemented the DAS movement style down to the frame
    - Next piece counter now works
    - Fixed a bug where the rotation saved so that a new block spawned isn't in the default rotation
    - Piece lock delay to mimic NES Tetris (this could be causing an issue with pieces being fed in multiple times, not sure yet)
    - A game over ANIMATION
- Jawwad: still sick but doesn't want to be complacent:
    - trying to figure out why edge rotation won't work
      - crazy idea but what if we make the grid 12 by 20 but only have the center 10 be black? That should allow rotation at the "edges"
    - Fixed centered rotation for S/Z/L pieces after Kevin gave classic NES Tetris videos showing that our hardcoded rotations were shifted down or to the right when they shouldn't have been
- Bug fixes + new bugs:
    - moveDown() not locking is over
    - fast last minute changes can cause multiple locks
      - at least the piece is guaranteed to lock tho so Issue # 3 of day 6 is now something less worse?
    - still edge rotation doesn't work

_____

[Day 9] 5/26/19
- Kevin:
    - Fixed the bug where a locked piece gets fed into the array multiple times
    - Code cleanup
- Jawwad:
    - went to experimental with a copy of Tetris now named Rotation_Bounds
      - tried to figure out a way to make rotations work on edges
        - success! sorta... See  [Experiments](Experiments/Experiments.md) for more details
        
_____

[Day 10] 5/27/19
- Kevin: 
    - Ability to clear lines via ***collection.sorting*** the lines that are filled in an ***arrayList*** known as linesToClear
    - Scoring/lines is now tracked as a result of the above
       - the grid is tracked upon and checked every frame in draw, and if there are any lines that are full, they will be added as an integer of what row they are on to linesToClear, sorted, turned to black {aka cleared}, removed from linesToClear, and the score shall update.
____

[Day 11] 5/28/19
- Kevin: 
    - Background music (need to find a way to pause music while keeping it on loop, play/pause does not satisfy this purpose)
- Jawwad:
    - Fixed rotation at the edges/ rotating out in Experimental
      - fixed an issue where the constant joint in rotation for J was not always in the same place, causing issues where J piece rotated out of bounds
      - similar event for Z rotation
      - as a consequence, spins are now impossible :( but seeing as how we are emulating NES tetris and non modern additions, in which spins have no rewarding system and are extremely rare as is, this feature isn't as nearly missed as it should be.
        - we're pretty sure the only spin that was working before was T spin and that was by unknown means.
      - once everyone agrees (show tmrw in class) this will be moved to master. 
_____

[Day 12] 5/29/19 
- Jawwad:
    - "merged" rotation_bounds with tetris so now we have working rotation at edges + delete lines/ score updating
        - in tight areas where one could technically still rotate, the rotation is sometimes locked (most obvious with a z piece that is between an edge and a wall of fed pieces two away from the edge (so the z piece is basically touching both walls) as a side effect.
    - removed the 12 by 20 grid after fixing code to work on 10 by 20. 
- Kevin:
    - cleaned up and reorganized code from Tetris to different tabs 
_____

[Day 13] 5/30/19
- Jawwad:
    - began work on startup before the actual game in start tab
      - there are three start screens (the title screen, type/music selection screen, and level selection screen). These have been downloaded pngs that have been resized a little bit in the data folder + edited/ cleaned to black in certain sections as arrays will go ontop.
   - setup and draw take boolean values to determine what to display (start0, start1, start2)
- Kevin:
   - tested music (3 choices) in class 
      - (music pausing when game is paused and starting where left off)
   - began writing code to loop music before it fades and ends.
_____

[Day 14] 5/31/19
- Kevin: 
   - Got started on a statistics tab tracking how many pieces of each type have been dropped
- Jawwad:
    - Figured out what order to put the screen loading in setup so music would not be disrupted.
      - screen progression through mouseclicks
_____

[Day 15] 6/1/19 (We're so close!)
- Kevin:
   - math calculations for requirements of level progression
- Jawwad:
    - edited startup screens to be blank in certain areas
    - user can now select music, highlighted by green instead of white text, via the S and W keys. Mouseclick to confirm
      - music is automatically turned off at the beginning of game, regardless of selection. Press enter twice after selecting the music.
         - we are trying to fix this so music begins playing as soon as the player is on startup level selection
    - user can now select what level to start from. Please note that whatever level you start from + 1 * 10 is how many lines you need to clear in order to progress to next level. And that level is directly tied to speed so don't choose something you can't handle!
      - also highlighted by green text instead of white. Use W,A,S,D to choose and mouseclick to confirm.
- BUGS found/ Things to Fix/Alter
    - only happened once and cannot recreate but definitely happened: I piece last minute movement when ___ over an upright Z piece went over the z piece.
    - T spins! Try to make leftBounds/RightBounds/fixRotation apply in createT() instead of when rotating to allow spins, as per K's suggestion of try to rotate, see if in bounds, do or don't based on response.
      - these are the only ones present in NES tetris
      - currently our code is: see if in bounds, then rotate if yes. This leads to areas where pieces cannot rotate because at least one point is touching DESPITE having space to rotate.
_____

[Day 16] 6/2/19
- Kevin: 
    - fixed music not immediately playing once game started issue
    - added more sound effects for level selection, music selection, startup progression, rotation, movement, leveling up and locking.
    - finished looping for all music files.
- Jawwad:
    - attempted and hopefully fixed overlapping over fed pieces hard-to-replicate- bug via checking if the piece's immediate conversion as well as to the left, right, and down of it are all available.
    - Attempted to fix T spins (these were the only spins available in NES tetris, and even then super conservative) and failed :/
      - the closest attempt caused pieces to generate at origin (left hand corner) once there were boundary issues.
    - Added instructions for user at startup screens with a little bit of blinking
      ```diff
      + this does not exist in game, just a small touch.
      ```
      - also cleaned up start up screen images/refined the text using text instead of the image, and added our names.
    - fixed a bug that caused pieces to rotate out of left bounds and reinstated upper bounds just in case.
- Stuff not Happy about:
    - the keys are so awkward I keep hitting J and K for rotation instead of H and J,
    - spinning, even though it's uber rare to begin with in the actual game, would be nice to keep :/
      - as of this point we have not found a way to allow T Spins to work properly and at all times, so 
      ```diff 
      - we will not be pursuing it at this stage
      ```
_____
[Day 17] 6/3/19
- Kevin: 
    - added instructions to README
    - removed visual debug stuf
    - in an effort to what we have determined to be a piece rotating last second when already locked, causing the overlap issue, added a delay to piece generation.
    - Jawwad is preparing for EID
_____
[Day 18] 6/4/19 <<Finale... but also Eid>>
- Kevin:
    - driver mapper relationship once more because Jawwad is stuck with Eid festivities:
      - added the option to go back in start up using the H key
      - changed the continue key from mouseclicking to enter.
- Jawwad:
    - only was able to be up on for 30 minutes before getting back to work BUT
      - fixed a bug that caused audio to act really weird (and creepy) if the player decided to go back to previous screen after pressing J.
         - coincidentally, clicking J in an area it wasn't supposed to be called could sometimes change the color of the "Press ENTER to Continue" message.
    - updated README with DevLogs + instructions, color coding certain parts of NES tetris that were removed/added in devLog
_____

   

