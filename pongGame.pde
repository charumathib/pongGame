Ball b = new Ball();
PaddleBlue blue = new PaddleBlue();
PaddleGreen green = new PaddleGreen();
import g4p_controls.*;
import java.awt.Font;
GButton playersList;
GTextField player1, player2;
float xSpeed = 5;
float ySpeed = random(height);


public void setup() {
  fullScreen();
  background(0);
  startScreen();
}

public void draw() {
}

public void handleButtonEvents(GButton playersList, GEvent event) {
  background(0);
  gameScreen();
  gamePlay();
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
  fill(0);
  rect(0, 0, width, height);
  for (int i=0; i<=height+50; i+=30) {
    fill(#ED00FF);
    rect(width/2-2.5, i, 5, 10);
  }
  playersList.setVisible(false);
  player1.setVisible(false);
  player2.setVisible(false);
  String whoIsPlayer1 = player1.getText().trim();
  String whoIsPlayer2 = player2.getText().trim();
  fill(255);
  textSize(32);
  fill(#00CAFF);
  text(whoIsPlayer1, 10, 50);
  fill(#7AFF00);
  text(whoIsPlayer2, width-150, 50);
}

public void gamePlay() {
  blue.draw();
  green.draw();
  b.draw();
}



public void ballMotion() {
}