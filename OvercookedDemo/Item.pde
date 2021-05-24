public class Item {
  float x, y;
  color c;
  float radius = 1080 / 40;
  
  Item(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }
  
  void display() {
    stroke(0);
    fill(c);
    ellipse(x, y, radius*2, radius*2);
  }
  
  void setXY(float x, float y) {
    this.x = x ;
    this.y = y ;
  }
}
