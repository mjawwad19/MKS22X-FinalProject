//used in screen 1
int[] lvls = new int [20]; //the ability to choose which level you begin on
//used in screen 2
PImage s0,s1,s2;
void start0() {
  s0 = loadImage("startup0.png");
  s0.resize(960, 720);
}
void start1() {
  s1 = loadImage("startup1.png");
  s1.resize(960,720);
  
}
void start2() {
  s2 = loadImage("startup2.png");
  s2.resize(960,720);
}

boolean startPress = false;
boolean selectedM = false;
boolean selectedL = false;

color choiceC = color(0,255,0); //green
int index = 0;

/*void cMusic() {
  if (
  */
