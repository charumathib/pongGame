public class Ball {
  float x ;
  float y ;
  float xSpeed = 5;
  float ySpeed = 5;
  boolean startpos =true;
  boolean randomY ;
  
  public boolean topBoundary() { 
    return (y <= 65);
  }

  public boolean bottomBoundary() { 
    return (y >= (height - 15));
  }

  boolean leftHalf() { 
    return (x <= width / 2);
  }

  boolean rightHalf() { 
    return (x > width / 2);
  }


  public void draw() {
    fill(255);
    if (startpos) {
      //ball will be at center of the screen at random height in the beginning
      x = width/2;
      y = random(height);
    }

    ellipse(x, y, 30, 30);



    startpos = false;
    randomY = !randomY ;

    if ( playerGreen) { 
      if ( topBoundary() ) {
        xSpeed = -5 ;
        ySpeed = +5 ;
      } else if (bottomBoundary()) {
        xSpeed = -5 ;
        ySpeed = -5 ;
      } else { // neither of the boundaries
        xSpeed = -10;
        ySpeed =  -5 ;
      }
    } else if ( playerBlue ) {
      if ( topBoundary() ) {
        xSpeed = +5 ;
        ySpeed = +5 ;
      } else if (bottomBoundary()) {
        xSpeed = +5 ;
        ySpeed = -5 ;
      } else { // neither of the boundaries
        xSpeed = 10;
        ySpeed = +5 ;
      }
    } else { 
      if ( topBoundary() && leftHalf()) {
        xSpeed = -5 ;
        ySpeed = +5 ;
      } else if (topBoundary() && rightHalf()) {
        xSpeed = +5 ;
        ySpeed = +5 ;
      } else if (bottomBoundary() && leftHalf()) {
        xSpeed = -5 ;
        ySpeed = -5 ;
      } else if (bottomBoundary() && rightHalf()) {
        xSpeed = +5 ;
        ySpeed = -5 ;
      }
    }

    if ( topBoundary() || bottomBoundary() ) { 
      boundary.play();
      if ( playerGreen ) { playerGreen = false ; } 
      if ( playerBlue ) { playerBlue = false ; } 
    } 

    //if (y>=height && x>width/2 && x<width && !playerGreen) {
    //  //if the ball hits the bottom right of screen bounce to right side by decrementing y and incrementing x
    //  xSpeed = +5;
    //  ySpeed = -5;
    //  boundary.play();
    //} else if (y>=height && x>width/2 && x<width && playerGreen) {
    //  xSpeed = -5;
    //  ySpeed = -5;
    //  //playerGreen = false;
    //}
    //if (y>=height && x<width/2 && x != 0 && !playerBlue) {
    //  //if the ball hits the bottom left of screen bounce to left side by decrementing x and decrementing y
    //  xSpeed = -5;
    //  ySpeed = -5;
    //  boundary.play();
    //} else if (y>=height && x<width/2 && x != 0 && playerBlue) {
    //  xSpeed = 5;
    //  ySpeed= -5;
    //  //playerBlue = false;
    //}
    //if (y<=50 && x>width/2 && x < width && !playerGreen) {
    //  //if the ball hits top boundary of screen bounce to right by incrementing both x and y
    //  xSpeed = +5;
    //  ySpeed = +5;
    //  boundary.play();
    //} else if (y<=50 && x>width/2 && x < width && playerGreen) {
    //  xSpeed = -5;
    //  ySpeed = 5;
    //  //playerGreen = false;
    //}
    //if (y<=50 && x<width/2 && x !=0 && !playerBlue) {
    //  //if the ball hits top boundary of screen bounce to left by decrementing  x and incrementing y
    //  xSpeed = -5;
    //  ySpeed = +5;
    //  boundary.play();
    //} else if (y<=50 && x<width/2 && x !=0 && playerBlue ) {
    //  xSpeed = 5;
    //  ySpeed = 5;
    //  playerBlue = false;
    //}


    //if (y>=50 && y<= height && playerGreen) {
    //  //if the ball hits the green paddle at any y pos >=50 make it move fast to left 
    //  xSpeed = -10;
    //  ySpeed = -5;
    //  paddleSound.play();
    //}
    //if (y>=50  && y<= height && playerBlue) {
    //  //if the ball hits the blue paddle at any y pos >=50 make it move fast to right 
    //  xSpeed = +10;
    //  ySpeed= -5;
    //  paddleSound.play();
    //}

    if (ballLeavesRightBoundary()) {
      startpos = true;
      xSpeed = -5;
      ySpeed = -5;
      playerBlueScore++;
      Score.play();
    } else if (ballLeavesLeftBoundary()) {
      startpos= true;
      xSpeed = 5;
      ySpeed = -5;
      playerGreenScore++;
      Score.play();
    }

    x += xSpeed ; 
    y += ySpeed ;
    println("x :" + x + " y :" + y );
  }

  boolean ballLeavesRightBoundary() { 
    return x >= (width ) ;
  }

  boolean ballLeavesLeftBoundary() {
    return x <= 0 ;
  }
}