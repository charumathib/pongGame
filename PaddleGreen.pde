public class PaddleGreen {
  int movement2 = height/2;
  public void draw() {
    fill(#7AFF00);
    rect(width-12, movement2, 10, 50);

    if (this.movement2 >height-50) {
      this.movement2 = height-50;
    }
    if (this.movement2< 50) {
      this.movement2 = 50;
    }
  }

  public void keyPressed() {
    if (key == 'k') {
      fill(0);
      rect(0, 0, 50, height);
      fill(#7AFF00);
      rect(width-12, movement2, 10, 50);
      movement2+=40;
    } else if (key == 'i') {
      fill(0);
      rect(0, 0, 50, height);
      fill(#7AFF00);
      rect(width-12, movement2, 10, 50);
      movement2-=40;
    }
  }
}