public class Ball {
  float x ;
  float y ;
  float xSpeed = 5;
  float ySpeed = 5;
  boolean startpos =true;
  float speedX = 1 ;
  float speedY = 1 ;
  int m = millis();

  public void draw() {
    fill(255);
    if (startpos) {
      //ball will be at center of the screen at random height in the beginning
      x = width/2;
      y = random(height);
    }
    //if (millis() - m >= 10000) { 
    //  m = millis();
    //  speedX+=5;
    //  speedY+=5;
    //}
    ellipse(x, y, 30, 30);

    //speedX = ( xSpeed > 0) ? speedX : -speedX ;
    x+=xSpeed ;
    
    //speedY = ( ySpeed > 0) ? speedY : -speedY ;    
    y+=ySpeed ;

    startpos = false;
    if (y>=height && x>width/2 && x<width ) {
      //if the ball hits the bottom right of screen bounce to right side by decrementing y and incrementing x
      xSpeed = +5;
      ySpeed = -5;
      boundary.play();
    } else if (y>=height && x<width/2 && x != 0 ) {
      //if the ball hits the bottom left of screen bounce to left side by decrementing x and decrementing y
      xSpeed = -5;
      ySpeed = -5;
      boundary.play();
    }
    if (y<=50 && x>width/2 && x < width ) {
      //if the ball hits top boundary of screen bounce to right by incrementing both x and y
      xSpeed = +5;
      ySpeed = +5;
      boundary.play();
    } else if (y<=50 && x<width/2 && x !=0 ) {
      //if the ball hits top boundary of screen bounce to left by decrementing  x and incrementing y
      xSpeed = -5;
      ySpeed = +5;
      boundary.play();
    }
    if (y>=50 && y<= height && playerGreen) {
      //if the ball hits the green paddle at any y pos >=50 make it move fast to left 
      xSpeed = -10;
      ySpeed = 1;
      playerGreen = false;
      paddleSound.play();
    } else if (y>=50  && y<= height && playerBlue) {
      //if the ball hits the blue paddle at any y pos >=50 make it move fast to right 
      xSpeed = +10;
      ySpeed= 3;
      playerBlue = false;
      paddleSound.play();
    }

    if (x>=width ) {
      startpos = true;
      xSpeed = -5;
      ySpeed = -5;
      playerBlueScore++;
      Score.play();
    }
    if (x<=0) {
      startpos= true;
      xSpeed = 5;
      ySpeed = -5;
      playerGreenScore++;
      Score.play();
    }
  }
}