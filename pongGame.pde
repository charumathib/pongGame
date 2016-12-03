Ball b = new Ball();
PaddleBlue blue = new PaddleBlue();
PaddleGreen green = new PaddleGreen();
import g4p_controls.*;
import java.awt.Font;
GButton playersList, singlePlayer, twoPlayers, twoAIs;
GTextField player1, player2;
boolean buttonPressed = false;
int playerBlueScore = 0;
int playerGreenScore = 0;
boolean playerBlue = false;
boolean playerGreen = false;
int winningScore = 2;
String whoIsPlayer1;
String whoIsPlayer2;
import processing.sound.*;
SoundFile paddleSound, Score, boundary, winningSound;
boolean playSoundOnce = false;
boolean gameOver = false;
int xMove = width/2;
boolean startX = true;
int x;
int textSize = 50;


public void setup() {
  fullScreen();
  background(0);
  startScreen();
  noStroke();
  paddleSound = new SoundFile(this, "p1.mp3");
  boundary = new SoundFile(this, "b.mp3");
  winningSound = new SoundFile(this, "g.mp3");
  Score = new SoundFile(this, "win.mp3");
}

public void draw() {
  if (buttonPressed) {
    gamePlay();
    gameScreen();
    if (b.x<=22  && b.y>=blue.bpaddleypos && b.y<=blue.bpaddleypos+100 ) {
      //if ball touches blue paddle
      playerBlue = true;
    }
    if (b.x>=width-22 && b.y>=green.gpaddleypos && b.y<=green.gpaddleypos+100) {
      playerGreen = true;
    }

    fill(#00CAFF);
    text(playerBlueScore, 300, 50);
    fill(#7AFF00);
    text(playerGreenScore, width-300, 50);

    if (gameOver) {
      endGameScreen();
    }

    if (playerGreenScore == winningScore ) {
      playSoundOnce = true;
      gameOver = true;
    } else if (playerBlueScore == winningScore) {
      playSoundOnce = true;
      gameOver = true;
    }
  }
}

public void handleButtonEvents(GButton playersList, GEvent event) {
  buttonPressed = true;
}

public void startScreen() {
  Font font = new Font("DialogInput", Font.BOLD, 32);
  playersList = new GButton(this, width/2-width/8, height/2-height/8, width/4, height/4, "BEGIN GAME" );
  playersList.setFont(font);
  player1 = new GTextField(this, width/2-width/8, height/2-height/8-height/4, width/4, height/8);
  player1.setFont(font);
  player2 = new GTextField(this, width/2-width/8, height/2+height/4, width/4, height/8);
  player2.setFont(font);
}

public void gameScreen() {
  playersList.setVisible(false);
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
  blue.keyPressed();
  green.keyPressed();
  key = (ESC);
  for (int i=0; i<=height+50; i+=30) {
    fill(#ED00FF);
    rect(width/2-2.5, i, 5, 10);
  }
}
public void endGame(String player) {
  b.x =width/2;
  b.y =height/2;
  b.xSpeed =0;
  b.ySpeed=0;
  fill(#FF0011);
  textSize(textSize);
  textSize++;
  if(textSize>=100){
    textSize-=5;
  }else if(textSize<=50){
    textSize++;
  }
  text("Game Over " + player, width/2-40, height/2 +40);
  textAlign(CENTER);
}

public void endGameScreen() {
  background(0);
  endGameBall();
  fill(#00CAFF);
  rect(0, 0, 100, height);
  fill(#7AFF00);
  rect(width-100, 0, 100, height);
  textAlign(CENTER);
  if (playerGreenScore == winningScore) {
    fill(0);
    endGame(whoIsPlayer2 + " Wins!");
    winningSound.play();
  } else {
    fill(0);
    endGame(whoIsPlayer1 + " Wins!");
    winningSound.play();
  }
}

public void endGameBall() {
  fill(255); 
  if (startX) {
    x = width/2;
    xMove = 5;
    startX = false;
  }
  if (!startX) {
    ellipse(x, height/2, 500, 500);
    x +=xMove;
    if (xMove>=350 && x<=width-350) {
      xMove=+5;
    }
    if (x >= width-350) {
      xMove=-5;
    }
    if (x<=350) {
      xMove=+5;
    }
  }
}

public void optionsMenu(){
  
}

public void AI() {
}