
class blueguy{
  
  float x,y,difficulty,xSize,ySize,pastx,pasty,speed;
  
    public blueguy(float x, float y, float difficulty, float speed, float xSize, float ySize) {
    this.x = x;
    this.y = y;
    this.difficulty = difficulty;
    this.xSize = xSize; 
    this.ySize = ySize;
    this.speed = speed;
  }
  
  boolean rectHitBox(float x, float y,float Width,float Height){
    boolean toReturn = false;
    if(px+psizeX>x && py+psizeY>y && px<x+Width && py<y+Height)
      toReturn = true;
  
    return toReturn;
}

  boolean faire(){
    pasty = py;
    pastx = px;
    
    boolean var = false;
    if(rectHitBox(x,y,xSize,ySize)){
    var = true;
    }
    fill(67, 100, 100, 100);
    rect(x,y,xSize,ySize);
    x-=((x-pastx)/dist(pastx, pasty, x, y)*this.speed);
    y-=((y-pasty)/dist(pastx, pasty, x, y)*this.speed);
    return var;
  }
}