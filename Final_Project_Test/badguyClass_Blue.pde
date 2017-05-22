class BlueBadguy {

  float x, y, difficulty, xSize, ySize, pastx, pasty, speed, life;

  public BlueBadguy(float x, float y, float difficulty, float speed, float xSize, float ySize, float life) {
    this.x = x;
    this.y = y;
    this.difficulty = difficulty;
    this.xSize = xSize; 
    this.ySize = ySize;
    this.speed = speed;
    this.life = life;
  }

  boolean rectHitBox(float x, float y, float Width, float Height) {
    boolean toReturn = false;
    if (px+psizeX>x && py+psizeY>y && px<x+Width && py<y+Height)
      toReturn = true;

    return toReturn;
  }

  boolean faire() {
    pasty = py;
    pastx = px;

    boolean var = false;
    if (rectHitBox(x, y, xSize, ySize)) {
      var = true;
    }
    fill(67, 100, 100, 100);
    rect(x, y, xSize, ySize);
    x-=((x-pastx)/dist(pastx, pasty, x, y)*this.speed);
    y-=((y-pasty)/dist(pastx, pasty, x, y)*this.speed);
    for (int b = pbullets.size() -1; b >= 0; b--) 
      if (b!=pbullets.size()) 
        if (pbullets.get(b).x+pbullets.get(b).xSize>x && pbullets.get(b).y+pbullets.get(b).ySize>y && pbullets.get(b).x<x+xSize && pbullets.get(b).y<y+ySize){ 
          life -= 1;
          pbullets.remove(b);
        }
    return var;
  }
}