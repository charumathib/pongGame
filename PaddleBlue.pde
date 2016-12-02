public class PaddleBlue {
  int bpaddleypos ;
  
  boolean bstartpos=true;
  
  public void draw() {
    if (bstartpos){
      bpaddleypos = height/2;
    }
     
    fill(#00CAFF);
    
    rect(2, bpaddleypos, 20, 100);

    if (this.bpaddleypos >height-100) {
      this.bpaddleypos = height-100;
    }
    if (this.bpaddleypos< 50) {
      this.bpaddleypos = 50;
    }
  }


  public void keyPressed() {
    if (key == 's') {
      bpaddleypos+=10;
      fill(#00CAFF);
      rect(2, bpaddleypos, 20, 100);
      bstartpos=false;

    } else if (key == 'w') {
      bpaddleypos-=10;
      fill(#00CAFF);
      rect(2, bpaddleypos, 20, 100);
          bstartpos=false;

    }
  }
}