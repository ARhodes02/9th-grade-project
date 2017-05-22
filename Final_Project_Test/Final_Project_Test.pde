int px, py, psizeX = 25, psizeY = 25, pspeed = 6, pdelay, pburstSize = 5;
boolean left, right, up, down;
boolean screenFlash;
ArrayList<RedBadguy> gamePeiceRed = new ArrayList();
ArrayList<BlueBadguy> gamePeiceBlue = new ArrayList();
ArrayList<PurpleBadguy> gamePeicePurple = new ArrayList();
ArrayList<bullet> pbullets = new ArrayList();
int sheild = 100;
int blueSpawn = 1;

void setup() {
  fullScreen();
  colorMode(HSB, 100, 100, 100, 100);
  background(0, 0, 0);
  px = width/2;
  py = height/2;
  noStroke();

  for (int i = 0; i < 1; i ++) {
    gamePeicePurple.add(new PurpleBadguy(200, 200, 20, 20, 20, 10, 200, 1));
    gamePeicePurple.add(new PurpleBadguy(width - 200, 200, 20, 20, 20, 10, 200, 1));
    gamePeicePurple.add(new PurpleBadguy(200, height - 200, 20, 20, 20, 10, 200, 1));
    gamePeicePurple.add(new PurpleBadguy(width - 200, height - 200, 20, 20, 20, 10, 200, 1));
  }

  for (int i = 0; i < 20; i ++) {
    gamePeiceRed.add(new RedBadguy(random(width, width*2), random(height), random(-6, -3), random(-5, 5), 15, 15));
  }
  for (int i = 0; i < 20; i ++) {
    gamePeiceBlue.add(new BlueBadguy(random(width, width*2), random(height), 5, 5, 15, 15, 1));
    i++; 
    gamePeiceBlue.add(new BlueBadguy(random(0-width, 0), random(height), 5, 5, 15, 15, 1));
    i++;
    gamePeiceBlue.add(new BlueBadguy(random(width), random(height, height*2), 5, 5, 15, 15, 1));
    i++;
    gamePeiceBlue.add(new BlueBadguy(random(width), random(0-height, 0), 5, 5, 15, 15, 1));
  }
  frameRate(60);
}

void draw() {
  fill(0, 0, 0, 10); //background fill
  rect(0, 0, width, height); //background

  for (int i = gamePeiceRed.size() -1; i >= 0; i--) { // moves through list of all red peices
    if (gamePeiceRed.get(i).faire()) {                // draws and moves all red peices an then checks for interaction with player
      background(100, 100, 50);                       // does screen flash if there is an interaction with player
      gamePeiceRed.remove(i);      // removes object if it does interact with player
      gamePeiceRed.add(new RedBadguy(random(width, width*2), random(height), random(-6, -3), random(-5, 5), 15, 15));
      sheild -= 10;                                        // removes a life if there in an interaction with player
    } else if (gamePeicePurple.size() == 0) {            // checks if red peice is off screen on the left
      gamePeiceRed.remove(i);                         // if it is removes red peice from the left
      gamePeiceRed.add(new RedBadguy(random(width, width*2), random(height), random(-6, -3), random(-5, 5), 15, 15)); // and respawns a new one on the right
    }
  }
  for (int i = gamePeiceBlue.size() -1; i >= 0; i--) {  // does the same this as the above code but for blue instead of red
    if (gamePeiceBlue.get(i).faire()) {
      background(67, 100, 50);
      gamePeiceBlue.remove(i);
      sheild -= 5;
      /*
      if (blueSpawn == 1) {
        gamePeiceBlue.add(new BlueBadguy(random(width, width*2), random(height), 5, 5, 15, 15));
        blueSpawn = 2;
      } else if (blueSpawn == 2) {
        gamePeiceBlue.add(new BlueBadguy(random(0-width, 0), random(height), 5, 5, 15, 15));
        blueSpawn = 3;
      } else if (blueSpawn == 3) {
        gamePeiceBlue.add(new BlueBadguy(random(width), random(height, height*2), 5, 5, 15, 15));
        blueSpawn = 4;
      } else if (blueSpawn == 4) {
        gamePeiceBlue.add(new BlueBadguy(random(width), random(0-height, 0), 5, 5, 15, 15));
        blueSpawn = 1;
      }
      */
    }
  }
  fill(35, 100, 75, 100);
  rect(px, py, psizeX, psizeY);

  if (right&&px+pspeed+psizeX<=width) {
    px+=pspeed;
  }
  if (left&&px-pspeed>=0) {
    px-=pspeed;
  }
  if (up&&py-pspeed>=0) {
    py-=pspeed;
  }
  if (down&&py+pspeed+psizeY<=height) {
    py+=pspeed;
  }

  textSize(20);
  text("Sheild %: " + sheild, width-130, 25);

  if (sheild <= 0) { // ends game
    sheild = 0;
    for (int i = gamePeiceRed.size() -1; i >= 0; i--) { // removes all red
      gamePeiceRed.remove(i);
    }
    for (int i = gamePeiceBlue.size() -1; i >= 0; i--) { // removes all blue
      gamePeiceBlue.remove(i);
    }
    for (int i = gamePeicePurple.size() -1; i >= 0; i--) { // removes all blue
      gamePeicePurple.remove(i);
    }
    textSize(200);
    text("Game Over", 75, 200); // says Game Over if lose
  }else if(gamePeiceRed.size() == 0 && gamePeiceBlue.size() == 0 && gamePeicePurple.size() == 0){
    for (int i = gamePeiceRed.size() -1; i >= 0; i--) {
      gamePeiceRed.remove(i);
    }
    textSize(200);
    text("You Win", 100, 200);
  }
  if (mousePressed && pdelay <= 0) { //makes bullets for player
    fill(35, 100, 75, 100);
    pbullets.add(new bullet(px+psizeX/2, py+psizeY/2, mouseX, mouseY, 15, 5, 5, 10, color(35, 100, 75)));
    pburstSize++;
    if (pburstSize >= 10) {
      pdelay = 20;
      pburstSize = 0;
    }
  }

  for (int i = pbullets.size() -1; i >= 0; i--) {
    pbullets.get(i).faire();
    if (pbullets.get(i).x>width || pbullets.get(i).x<0 || pbullets.get(i).y>height || pbullets.get(i).y < 0) {
      pbullets.remove(i);
    }
  }
  pdelay--;  //end of bullet logic


  for (int i = gamePeiceBlue.size() -1; i >= 0; i--) {
    for (int b = pbullets.size() -1; b >= 0; b--) {
      if (b!=pbullets.size() && i!=gamePeiceBlue.size()) {
        if (pbullets.get(b).x+pbullets.get(b).xSize>gamePeiceBlue.get(i).x && pbullets.get(b).y+pbullets.get(b).ySize>gamePeiceBlue.get(i).y && pbullets.get(b).x<gamePeiceBlue.get(i).x+gamePeiceBlue.get(i).xSize && pbullets.get(b).y<gamePeiceBlue.get(i).y+gamePeiceBlue.get(i).ySize) {
          pbullets.remove(b);
          gamePeiceBlue.remove(i);
          /*
          if (blueSpawn == 1) {
            gamePeiceBlue.add(new BlueBadguy(random(width, width*2), random(height), 5, 5, 15, 15));
            blueSpawn = 2;
          } else if (blueSpawn == 2) {
            gamePeiceBlue.add(new BlueBadguy(random(0-width, 0), random(height), 5, 5, 15, 15));
            blueSpawn = 3;
          } else if (blueSpawn == 3) {
            gamePeiceBlue.add(new BlueBadguy(random(width), random(height, height*2), 5, 5, 15, 15));
            blueSpawn = 4;
          } else if (blueSpawn == 4) {
            gamePeiceBlue.add(new BlueBadguy(random(width), random(0-height, 0), 5, 5, 15, 15));
            blueSpawn = 1;
          }
          */
        }
      }
    }
  }

  for (int i = gamePeiceRed.size() -1; i >= 0; i--) {
    for (int b = pbullets.size() -1; b >= 0; b--) {
      if (b!=pbullets.size() && i!=gamePeiceRed.size()) {
        if (pbullets.get(b).x+pbullets.get(b).xSize>gamePeiceRed.get(i).x && pbullets.get(b).y+pbullets.get(b).ySize>gamePeiceRed.get(i).y && pbullets.get(b).x<gamePeiceRed.get(i).x+gamePeiceRed.get(i).xSize && pbullets.get(b).y<gamePeiceRed.get(i).y+gamePeiceRed.get(i).ySize) {
          pbullets.remove(b);
          gamePeiceRed.remove(i);
          gamePeiceRed.add(new RedBadguy(random(width, width*2), random(height), random(-6, -3), random(-5, 5), 15, 15));
        }
      }
    }
  }
  
  
  for (int i = gamePeicePurple.size() -1; i >= 0; i--) {
    if(gamePeicePurple.get(i).faire())
    gamePeicePurple.remove(i);
  }
  
  
}