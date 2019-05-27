
[Day 1] 5/19/19
  - So Jawwad's been experimenting for a while, TRYING to make a pieces class with all the movement and stuff WORK with Tetris.pde and he has given up for now because of random generation of a piece causing nullpointerexception errors.
  - He also found a nicer, cleaner, easier way of creating the shapes:
    - instead of relying on vertices to create the shapes, work with groups of 4 blocks (I say blocks but not the block class) and addChild them.
    - this way we can maintain a) the borders of each individual 'block', b) get each of the child's positions (and therefore restrict/allow movement), c)can figure out how to rotate based on the average of the coordinates of child 2 and 3 to revolve around, AND! check for any collision between different families!

[Day 9] 5/27/19
  - Jawwad's been experimenting with rotation on edges...
    - use the consistent joints in every spin to figure out if rotation should be allowed.
      - somehow this alone works, but this alone also causes so many multiple locks
    - however with other things, this does basically nothing but keep the items in bounds. Even if they can and should be able to rotate at the edges. But hey, at least no rotating out from what he sees?
      - this is due to the edges not having a block @ the edge so in the try catch of ____bound() methods, it will immediately net false.
        - change scenarios of bounds when at edge?
        - custom boundings ???
        - still figuring that out.
      - found 2 lock issues with this and the rest of stuff ( 1 blue J but was not able to recreate, and right before game over on a non I 2 block height  piece.
        - will have to check if these lock issues exist outside of experimental.
  
