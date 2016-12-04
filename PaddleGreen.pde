public class PaddleGreen extends Paddle {

  public PaddleGreen() {
    this.paddleColor = #7AFF00;
    this.xPos = width - 22;
    this.upKey = 'i';
    this.downKey = 'k';
  }

  public boolean ballTouchesPaddle(Ball b) { 
    return b.x>=width-22 && b.y>=this.yPos && b.y<=this.yPos+100 ;
  }
}