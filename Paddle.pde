public abstract class Paddle {
  int yPos ;

  boolean startpos=true;

  int paddleColor;

  int  xPos;

  char upKey, downKey;
  
  boolean ballTouchesPaddle ; 

  public void draw() {
    noStroke();
    if (startpos) {
      yPos = height/2;
    }

    fill(paddleColor);

    rectMode(CORNER);
    rect(xPos, yPos, 20, 100);

    if (this.yPos >height-100) {
      this.yPos = height-100;
    }
    if (this.yPos< 50) {
      this.yPos = 50;
    }
  }


  public void keyPressed(Ball b) {
    if (key == downKey) {
      yPos+=40;
      startpos=false;
    } else if (key == upKey) {
      yPos-=40;
      startpos=false;
    }
  }

  // Automatic logic to track the movement of the paddle with the ball
  public void ai_logic(Ball b, Paddle p) { 
    if ( abs(b.x - p.xPos) <= width/2) { 
      if ( b.y <= (p.yPos ) ) { 
        p.yPos-=40;
        p.startpos=false;
      } else if ( b.y >= (p.yPos )) { 
        p.yPos+=40;
        p.startpos=false;
      }
    }
  }

  public abstract boolean ballTouchesPaddle(Ball b) ;
}