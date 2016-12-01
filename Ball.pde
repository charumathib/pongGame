public class Ball {
  float xSpeed = width/2;
  float ySpeed = random(height);

  public void draw() {
    fill(255);
    ellipse(xSpeed, ySpeed, 30, 30);
    if (ySpeed>=0 && ySpeed<=height) {
      xSpeed++;
      ySpeed++;
    }
  }
}