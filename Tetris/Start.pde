//used in screen 1
int[] lvls = new int [20]; //the ability to choose which level you begin on
//used in screen 2
PImage s0, s1, s2;
void start0() {
  s0 = loadImage("startup0.png");
  s0.resize(960, 720);
}
void start1() {
  s1 = loadImage("startup1.png");
  s1.resize(960, 720);
}
void start2() {
  s2 = loadImage("startup2.png");
  s2.resize(960, 720);
}

boolean startPress = false;
boolean selectedM = false;
boolean selectedL = false;

color choiceC = color(0, 255, 0); //green
int indexM = 0;


boolean cMusic() {
  if (indexM == 0) {
    bgMusic = new SoundFile(this, "music1.wav");
    return true;
  }
  else if (indexM == 1) {
    bgMusic = new SoundFile(this, "music2.wav");
    return true;
  }
  else if (indexM == 2) {
    bgMusic = new SoundFile(this, "music3.wav");
    return true;
  }
  else return false;
}

void cycleMChoice() {
  if (keyPressed) {
    switch (key) {
    case 's':
      if (indexM == 3) indexM = 0;
      else indexM++;
      break;
    case 'w':
      if (indexM == 0) indexM = 3;
      else indexM--;
      break;
    }
  }
}
