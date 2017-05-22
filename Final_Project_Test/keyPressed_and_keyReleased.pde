void keyPressed(KeyEvent evt) {
  int keyVal = evt.getKeyCode();
  if (keyVal == 87)
    up = true;
  if (keyVal == 83)
    down = true;
  if (keyVal == 65)
    left = true;
  if (keyVal == 68)
    right = true;
}

void keyReleased(KeyEvent evt) {
  int keyVal = evt.getKeyCode();
  if (keyVal == 87)
    up = false;
  if (keyVal == 83)
    down = false;
  if (keyVal == 65)
    left = false;
  if (keyVal == 68)
    right = false;
}