public class PaddleBlue {
  int movement = height/2;
  public void draw() {
    fill(#00CAFF);
    rect(2, movement, 10, 50);

    if (this.movement >height-50) {
      this.movement = height-50;
    }
    if (this.movement< 50) {
      this.movement = 50;
    }
  }


  public void keyPressed() {
    if (key == 's') {
      movement+=40;
      fill(0);
      rect(0, 0, 50, height);
      fill(#00CAFF);
      rect(2, movement, 10, 50);
    } else if (key == 'w') {
      movement-=40;
      fill(0);
      rect(0, 0, 50, height);
      fill(#00CAFF);
      rect(2, movement, 10, 50);
    }
  }
}