public class Item {
  float x, y;
  color c;
  float radius;
  
  Item(float x, float y, color c, float width) {
    this.x = x;
    this.y = y;
    this.c = c;
    radius = width / 40;
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
