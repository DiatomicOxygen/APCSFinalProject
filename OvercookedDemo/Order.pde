public class Order {
  int curTime ;
  int endTime ;
  Container container;
  Integer score;
  
  Order(float x, float y, int curTime, int endTime, Integer score) {
    container = new Container(x,y,255,"plate");
    this.curTime = curTime ;
    this.endTime = endTime ;
    this.score = score;
  }
  
  void display(float x, float y) {
    noStroke() ;
    fill(255) ;
    rect(x,y,108,72) ;
    colorMode(HSB,359,100,100) ;
    color c = color(3.3*(endTime-curTime)+10,90,90) ;
    fill(c) ;
    rect(x,y,108 - 108 * (1 - (float)(endTime - curTime)/30),20) ;
    colorMode(RGB,255,255,255) ;
    stroke(0);
    container.setXY(x+54,y+46);
    container.display();
    for (Item i : container.ingredients) {
      i.display();  
    }
    
}

  void reward() {
    score += (endTime - curTime);  
  }
  
}
