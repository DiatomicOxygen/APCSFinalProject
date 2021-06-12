public class Order {
  int strTime ;
  int curTime ;
  int endTime ;
  Container container;
  
  Order(float x, float y, int strTime, int curTime, int endTime) {
    container = new Container(x,y,255,"plate");
    this.strTime = strTime ;
    this.curTime = curTime ;
    this.endTime = endTime ;
  }
  
  void display(float x, float y) {
    noStroke() ;
    fill(255) ;
    rect(x,y,108,72) ;
    colorMode(HSB,359,100,100) ;
    color c = color((100/(endTime+1 - strTime))*(endTime-curTime)+10,90,90) ;
    fill(c) ;
    rect(x,y,108 - 108 * (1 - (float)(endTime - curTime)/(endTime - strTime)),20) ;
    colorMode(RGB,255,255,255) ;
    stroke(0);
    container.setXY(x+54,y+46);
    container.display();

    
}

  void reward() {
    score += 20 ;
    if ((curTime - (endTime - strTime)/2) >= 1) tips += (curTime - (endTime - strTime)/2) ;  
    endTime = 0;
    curTime = 0;
  }
  
}
