
[Day 1] 5/19/19
  -So Jawwad's been experimenting for a while, TRYING to make a pieces class with all the movement and stuff WORK with Tetris.pde and he has given up for now because of random generation of a piece causing nullpointerexception errors.
  -He also found a nicer, cleaner, easier way of creating the shapes:
    - instead of relying on vertices to create the shapes, work with groups of 4 blocks (I say blocks but not the block class) and addChild them.
    -this way we can maintain a) the borders of each individual 'block', b) get each of the child's positions (and therefore restrict/allow movement), c)can figure out how to rotate based on the average of the coordinates of child 2 and 3 to revolve around, AND! check for any collision between different families!
