public class PaddleBlue extends Paddle {

  public PaddleBlue() {
    this.paddleColor = #00CAFF;
    this.xPos = 2;
    this.upKey = 'w';
    this.downKey = 's';
  }

  public boolean ballTouchesPaddle(Ball b) { 
    return b.x<=22  && b.y>=this.yPos && b.y<=this.yPos+100;
  }
}