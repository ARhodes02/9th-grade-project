void TitleScreen() {

  for (int i = 200; i > 0; i--) {
    strokeWeight(random(3));
    stroke(random(100));
    point(random(1, width - 1), random(1, height - 1));
    if (buton(225, height - 235, 800, 200, color(67, 100, 85))) {
      state = 1;
    }
  }
  strokeWeight(random(3));
  fill(33, 100, 85);
  textSize(100);
  text("Welcome To ...", 30, 200);
  text("That Weird Space Game!", 30, 300);

  textSize(50);
  fill(33, 100, 85);
  text("By: That Weird Guy!", 35, 380);

  textSize(100);
  fill(0, 0, 100);
  text("Continue", 400, 700);

  if (buton(225, height - 235, 800, 200, color(100, 100, 100, 0))) background(0, 0, 0);
}