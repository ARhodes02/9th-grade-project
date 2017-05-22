class bullet {

  float x, y, xSize, ySize, dirx, diry, speed, penatration;
  color c;

  public bullet(float x, float y, float targetX, float targetY, float speed, float xSize, float ySize, float penatration, color c) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    this.speed = speed;
    this.penatration = penatration;
    this.c = c;
    dirx = ((x-targetX)/dist(targetX, targetY, x, y)*this.speed);
    diry = ((y-targetY)/dist(targetX, targetY, x, y)*this.speed);
  }


  void faire() {
    fill(c);
    rect(x, y, xSize, ySize);
    x-=dirx;
    y-=diry;
    return;
  }
  
}