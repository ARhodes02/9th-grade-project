boolean buton(float x, float y, float Width, float Height, color c) {
  boolean toReturn = false;
  if (mousePressed && mouseX+psizeX>x && mouseY+psizeY>y && mouseX<x+Width && mouseY<y+Height) {
    toReturn = true;
  }
  fill(c);
  stroke(0, 0, 0);
  strokeWeight(2);
  rect(x, y, Width, Height);
  return toReturn;
}