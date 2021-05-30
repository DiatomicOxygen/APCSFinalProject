public class Order extends Container {
  int curTime ;
  int endTime ;
  Integer score;
  
  Order(float x, float y, color c, String name, int curTime, int endTime, Integer score) {
    super(x,y,c,"plate");
    this.name = name;
    ingredients = new ArrayList<Item>();
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
  }

  void reward() {
    score += (endTime - curTime);  
  }
  
}
