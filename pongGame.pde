Ball b = new Ball();
PaddleBlue blue = new PaddleBlue();
PaddleGreen green = new PaddleGreen();
import g4p_controls.*;
import java.awt.Font;
GButton playersList;
GTextField player1, player2;
boolean buttonPressed = false;
int playerBlueScore = 0;
int playerGreenScore = 0;
boolean playerBlue = false;
boolean playerGreen = false;
int winningScore =10;
String whoIsPlayer1;
String whoIsPlayer2;
import processing.sound.*;
SoundFile bounceSound, Score;

 

public void setup() {
  fullScreen();
  background(0);
  startScreen();
  noStroke();
  bounceSound = new SoundFile(this, "Jump.bfxrsound");
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
    
    if (playerGreenScore == winningScore ){
      endGame(whoIsPlayer2 + " Wins");
    }else if (playerBlueScore == winningScore) {
      endGame(whoIsPlayer1 + " Wins");

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
    text("Game Over " + player ,width/2-40, height/2 +40);
    textAlign(CENTER);
    
    
  }
  
  public void AI(){
    
  }