class RedBadguy {

  float x, y, xSpeed, ySpeed, xSize, ySize;

  public RedBadguy(float x, float y, float xSpeed, float ySpeed, float xSize, float ySize) {
    this.x = x;
    this.y = y;
    this.xSpeed = xSpeed;
    this.ySpeed = ySpeed;
    this.xSize = xSize; 
    this.ySize = ySize;
  }

  boolean rectHitBox(float x, float y, float Width, float Height) {
    boolean toReturn = false;
    if (px+psizeX>x && py+psizeY>y && px<x+Width && py<y+Height)
      toReturn = true;

    return toReturn;
  }

  boolean faire() {
    boolean var = false;
    if (rectHitBox(x, y, xSize, ySize)) {
      var = true;
    }
    fill(100, 100, 100, 100);
    rect(x, y, xSize, ySize);
    x += xSpeed;
    y += ySpeed;
    //if(x>=width)xSpeed*=-1;
    //if(x<=0)xSpeed*=-1;
    if (y>=height)ySpeed*=-1;
    if (y<=0)ySpeed*=-1;
    return var;
  }
}