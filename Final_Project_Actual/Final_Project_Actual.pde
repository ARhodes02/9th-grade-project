int px, py, psizeX = 25, psizeY = 25, pspeed = 10, pdelay, pburstSize = 5;
boolean left, right, up, down;
boolean screenFlash;
ArrayList<bullet> pbullets = new ArrayList();
int sheild = 50, time = 2000;
int blueSpawn = 1;

int state = 0;

void setup(){
  fullScreen();
  colorMode(HSB, 100, 100, 100, 100);
  background(0,0,0);
  px = 20;
  py = 20;
  noStroke();
  frameRate(60);
}

void draw(){
  noStroke();
  fill(0, 0, 0, 10); //background fill
  rect(0, 0, width, height); //background
  if(state == 0){
    TitleScreen();
  }
  if(state == 1){
    
  }
  
}