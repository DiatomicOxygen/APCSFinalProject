public class Item {
  float x, y;
  color c;
  float radius = WIDTH / 40;
  String name;
  float rotation = 0;
  boolean visible = true ;
  
  Item(float x, float y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
    radius = width / 45;
    rotation = 3 * (float)Math.PI / 2 ;
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
  
  color getColor() {
    return c ;
  }
  
  boolean equals(Item b) {
     return this.name.equals(b.name); 
  }
  
  void changeRotation(float rotate) {
    rotation = rotate ;
  }
  
}
