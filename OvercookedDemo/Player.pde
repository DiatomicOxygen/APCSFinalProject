public class Player {
  float x, y;
  float radius = 1080 / 30;
  Item inHand;
  float direction = 0;
  boolean colliding;
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    stroke(0);
    fill(255, 0, 0);
    ellipse(x, y, radius*2, radius*2);
    line(x,y,x + cos(direction) * radius, y + sin(direction) * radius);
    if (inHand != null) {
       inHand.setXY(x + cos(direction) * radius, y + sin(direction) * radius); 
       inHand.display();
    }
  }
  
  void move (float dx, float dy, float d) {
   x += dx;
   y += dy;
   direction = d;
  }
  
  void collide(ArrayList<Tile> tiles) {
    
  }
  
  void pickUpDrop() {
    if(inHand != null) {
       
    }
  }
  
}
