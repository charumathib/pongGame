import g4p_controls.*;
import java.awt.Font;
import processing.sound.*;

Ball b;
Paddle blue, green;

GButton beginGame, singlePlayer, twoPlayers, demo;
GTextField player1, player2;

boolean buttonPressed, playerBlue, playerGreen, playSoundOnce, gameOver, canGameBegin, startX, largeText, optionsMenu;

int playerBlueScore, playerGreenScore, winningScore, xMove, x, textSize;

String whoIsPlayer1;
String whoIsPlayer2;

SoundFile paddleSound, Score, boundary, winningSound;

PImage img, img1, img2, img3;


public void setup() {
  fullScreen();
  resetGame();

  paddleSound = new SoundFile(this, "p1.mp3");
  boundary = new SoundFile(this, "meh.mp3");
  winningSound = new SoundFile(this, "hotlineBling.mp3");
  Score = new SoundFile(this, "win.mp3");
  img =loadImage("kewlGif.gif");
  

  noStroke();
}

public void draw() {
  if (gameOver) {
    endGameScreen();
  } else if (buttonPressed) {



    gamePlay();
    if (buttonPressed) {
      gameScreen();
    }

    playerBlue = blue.ballTouchesPaddle(b) ? true : playerBlue ;
    playerGreen = green.ballTouchesPaddle(b) ? true : playerGreen ;

    printScores();

    if ( playerGreenScore == winningScore || playerBlueScore == winningScore) { 
      playSoundOnce = true;
      gameOver = true;
    }
  }
}

void printScores() { 
  fill(#00CAFF);
  text(playerBlueScore, 300, 50);
  fill(#7AFF00);
  text(playerGreenScore, width-300, 50);
}

public void handleButtonEvents(GButton button, GEvent event) {
  if (button == singlePlayer && event == GEvent.CLICKED) {
    optionsMenu = false;
    hideOptionsMenu();
    background(0);
    startScreen(); 
    blue = new PaddleBlue();
    player2.setText("GREEN");
    green = new AIGreenPaddle();
  }
  if (button == twoPlayers && event == GEvent.CLICKED) {
    optionsMenu = false;
    background(0);
    startScreen();
    hideOptionsMenu();
    blue = new PaddleBlue();
    green = new PaddleGreen();
  }
  if (button == demo && event == GEvent.CLICKED) {
    optionsMenu = false;
    background(0);
    startScreen();
    hideOptionsMenu();
    player1.setText("BLUE");
    player2.setText("GREEN");
    green = new AIGreenPaddle();
    blue = new AIBluePaddle();
  }
  if (button == beginGame && event == GEvent.CLICKED) {
    buttonPressed = true;
  }
}

public void startScreen() {
  background(0);
  Font font = new Font("DialogInput", Font.BOLD, 32);
  beginGame = new GButton(this, width/2-width/8, height/2-height/8, width/4, height/4, "BEGIN GAME" );
  beginGame.setFont(font);
  player1 = new GTextField(this, width/2-width/8, height/2-height/8-height/4, width/4, height/8);
  player1.setFont(font);
  player2 = new GTextField(this, width/2-width/8, height/2+height/4, width/4, height/8);
  player2.setFont(font);
}


public void gameScreen() {
  beginGame.setVisible(false);
  player1.setVisible(false);
  player2.setVisible(false);
  whoIsPlayer1 = player1.getText().trim();
  whoIsPlayer2 = player2.getText().trim();
  textSize(32);
  fill(#00CAFF);
  text(whoIsPlayer1, 10, 50);
  fill(#7AFF00);
  text(whoIsPlayer2, width-150, 50);
}


public void gamePlay() {
  background(0);
  blue.draw();
  green.draw();
  b.draw();
  blue.keyPressed(b);
  green.keyPressed(b);
  key = (ESC);
  for (int i=0; i<=height+50; i+=30) {
    fill(#ED00FF);
    rect(width/2-5, i, 10, 20, 10);
  }
}
public void endGame(String player) {
  b.x =width/2;
  b.y =height/2;
  b.xSpeed =0;
  b.ySpeed=0;
  fill(#FF0011);
  textSize(textSize);
  if (largeText) { 
    textSize++;
  } else { 
    textSize--;
  }
  if (textSize>=100) {
    largeText = false ;
  } else if (textSize<=50) {
    largeText = true ;
  }
  text("Game Over " + player, width/2-40, height/2 +40);
  textAlign(CENTER);
}

public void endGameScreen() {
  background(0);
  floatingEmojis();
  //endGameBall();
  //fill(#00CAFF);
  //rect(0, 0, 100, height);
  //fill(#7AFF00);
  //rect(width-100, 0, 100, height);
  textAlign(CENTER);
  if (playerGreenScore == winningScore) {
    fill(0);
    endGame(whoIsPlayer2 + " Wins!");
    if ( playSoundOnce) { 
      winningSound.loop();
    }
    playSoundOnce = false;
  } else {
    fill(0);
    endGame(whoIsPlayer1 + " Wins!");
    if ( playSoundOnce) { 
      winningSound.loop();
    }
    playSoundOnce = false;
  }
}

public void floatingEmojis(){
  image(img, 100, 100,width-100, height-100);
  
}



//public void endGameBall() {
//  fill(255); 
//  if (startX) {
//    x = width/2;
//    xMove = 5;
//    startX = false;
//  }
//  if (!startX) {
//    ellipse(x, height/2, 500, 500);
//    x +=xMove;
//    if (xMove>=350 && x<=width-350) {
//      xMove=+5;
//    }
//    if (x >= width-350) {
//      xMove=-5;
//    }
//    if (x<=350) {
//      xMove=+5;
//    }
//  }
//}

public void optionsMenu() {
  Font font = new Font("DialogInput", Font.BOLD, 32);
  textSize(100);
  fill(#D0FC0F);
  text("CHOOSE YOUR GAME", 200, 150);
  singlePlayer = new GButton(this, width/2-150, height/2-100, 300, 100, "SINGLE PLAYER");
  singlePlayer.setFont(font);
  twoPlayers = new GButton(this, width/2-150, height/2+10, 300, 100, "MULTIPLAYER");
  twoPlayers.setFont(font);
  demo = new GButton(this, width/2-150, height/2+120, 300, 100, "DEMO MODE");
  demo.setFont(font);
}

public void hideOptionsMenu() {
  singlePlayer.setVisible(false);
  twoPlayers.setVisible(false);
  demo.setVisible(false);
}

public void keyPressed() {
  if (key == ENTER) {
    resetGame();
  }
}

public void resetGame() {
  background(0);
  setBooleans();
  setIntegers();

  b = new Ball();
  optionsMenu();
  if (!optionsMenu) {
    startScreen();
  }
}

public void setBooleans() {
  buttonPressed = false;
  playerBlue = false;
  playerGreen = false;
  playSoundOnce = false;
  gameOver = false;
  canGameBegin = false;

  largeText = true ; 
  optionsMenu = true;
  startX = true;
}

public void setIntegers() {
  playerBlueScore = 0;
  playerGreenScore = 0;
  winningScore = 1;
  xMove = width/2;
  x = 0;
  textSize = 50;
}