public class PaddleGreen {
  int gpaddleypos = height/2;
    boolean gstartpos=true;

  public void draw() {
    if (gstartpos){
      gpaddleypos = height/2;
    }
    
    fill(#7AFF00);
    rect(width-22, gpaddleypos, 20, 100);

    if (this.gpaddleypos > height-100) {
      this.gpaddleypos = height-100;
    }
    if (this.gpaddleypos< 50) {
      this.gpaddleypos = 50;
    }
  }

  public void keyPressed() {
    if (key == 'k') {
      fill(#7AFF00);
      rect(width-22, gpaddleypos, 20, 100);
      gpaddleypos+=10;
      gstartpos=false;
    } else if (key == 'i') {
      fill(#7AFF00);
      rect(width-22, gpaddleypos, 20, 100);
      gpaddleypos-=10;
      gstartpos=false;
    }
  }
}