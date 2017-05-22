class purpleguy {

  ArrayList<bullet> list = new ArrayList();
  float x, y, xSize, ySize, purpleDelay, bulletSpeed, purpleDelayControl, life, damage;
  boolean random = parseBoolean(parseInt(random(1)));

  public purpleguy(float x, float y, float xSize, float ySize, float delay, float bulletSpeed, float life, float damage) {
    this.x = x;
    this.y = y;
    this.xSize = xSize;
    this.ySize = ySize;
    purpleDelay = delay;
    this.bulletSpeed = bulletSpeed;
    this.life = life;
    this.damage = damage;
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
    fill(76, 100, 100, 100);
    rect(x, y, xSize, ySize);

    if (purpleDelayControl <= 0) { 
      fill(35, 100, 75, 100);
      list.add(new bullet(x+xSize/2, y+ySize/2, px, py, bulletSpeed, 5, 5, 10, color(76, 100, 100, 100)));
      purpleDelayControl = purpleDelay;
    }

    for (int i = list.size() -1; i >= 0; i--) {
      list.get(i).faire();
      if (list.get(i).x>width || list.get(i).x<0 || list.get(i).y>height || list.get(i).y < 0) {
        list.remove(i);
      }
    }


    for (int b = list.size() -1; b >= 0; b--) 
      if (b!=list.size()) 
        if (list.get(b).x+list.get(b).xSize>px && list.get(b).y+list.get(b).ySize>py && list.get(b).x<px+psizeX && list.get(b).y<py+psizeY) {
          list.remove(b);
          sheild -= damage;
        }
        
    
    for (int b = pbullets.size() -1; b >= 0; b--) 
      if (b!=pbullets.size()) 
        if (pbullets.get(b).x+pbullets.get(b).xSize>x && pbullets.get(b).y+pbullets.get(b).ySize>y && pbullets.get(b).x<x+xSize && pbullets.get(b).y<y+ySize){ 
          life -= 1;
          pbullets.remove(b);
        }
    
    if(life <= 0 )
      var = true;
    
    purpleDelayControl--;
    println(life);
    return var;
  }
}