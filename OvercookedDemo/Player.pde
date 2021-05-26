public class Player {
  float x, y;
  float radius;
  Item inHand;
  float direction = 0;
  boolean colliding;
  
  Player(float x, float y, float width) {
    this.x = x;
    this.y = y;
    radius = width / 30;
  }
  
  void display() {
    stroke(0);
    fill(255, 0, 0);
    ellipse(x, y, radius*2, radius*2);
    line(x,y,x + cos(direction) * radius, y + sin(direction) * radius);
    if (inHand != null) {
       inHand.setXY(x + cos(direction) * radius, y + sin(direction) * radius); 
    }
  }
  
  void move (float dx, float dy, float d) {
   x += dx;
   y += dy;
   direction = d;
  }
  
  void collide(ArrayList<Tile> tiles) {
    for (Tile t: tiles) {
      float testX = x + cos(direction) * radius;
      float testY = y + sin(direction) * radius;
      boolean colliding = testX >= t.x1 && testX <= t.x2 && testY >= t.y1 && testY <= t.y2;
      colliding = colliding || dist(x, y, t.x1, t.y1) <= radius;
      colliding = colliding || dist(x, y, t.x1, t.y2) <= radius;
      colliding = colliding || dist(x, y, t.x2, t.y1) <= radius;
      colliding = colliding || dist(x, y, t.x2, t.y2) <= radius;
      if (colliding) {
        x -= cos(direction) * radius * .5;
        y -= sin(direction) * radius * .5;
      }
    }

  }
  
  boolean pickUpDrop(ArrayList<Tile> tiles, ArrayList<Item> items) {
    if(inHand != null) {
      //Drop part of the method
       for (Tile t : tiles) {
          if(dist((t.x1 + t.x2)/2, (t.y1 + t.y2)/2, x, y) <= radius * 3) {
            if (! t.putOn(inHand)) {
              return false;
            }
            inHand = null;
            return true;
          }
       }
       inHand.setXY(inHand.x, inHand.y);
       inHand = null;
       return true; 
    } else {
      //Pick Up part of the method
      for (Tile t : tiles) {
          if(dist((t.x1 + t.x2)/2, (t.y1 + t.y2)/2, x, y) <= radius * 3) {
            inHand = t.retrieve();
            return true;
          }
       }
       for (Item i : items) {
          if(dist(i.x, i.y, x, y) <= radius * 1.5) {
            inHand = i;
            return true;
          } 
       }
    }
    return false;
  }
  
  void interact() {
   //to be implemented 
  }
  
}
