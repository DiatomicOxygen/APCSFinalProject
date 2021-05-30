public class Player {
  float x, y;
  float radius;
  Item inHand;
  float direction = 0;
  boolean colliding;
  
  Player(float x, float y, float width) {
    this.x = x;
    this.y = y;
    radius = width / 40;
  }
  
  void display() {
    stroke(0);
    fill(color(#95D3EA));
    ellipse(x, y, radius*2, radius*2);
    line(x,y,x + cos(direction) * radius, y + sin(direction) * radius);
    fill(color(255));
    ellipse(x, y, radius*1.3, radius*1.3);
    if (inHand != null) {
       inHand.setXY(x + cos(direction) * radius, y + sin(direction) * radius); 
    }
  }
  
  void move (float dx, float dy, float d, ArrayList<Tile> tiles) {
   x += dx;
   y += dy;   
   direction = d;
   collide(tiles) ;
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
        x -= cos(direction) * 5;
        y -= sin(direction) * 5;
      }
    }

  }
  
  boolean pickUpDrop(ArrayList<Tile> tiles, ArrayList<Item> items, ArrayList<Container> containers) {
    float xInFront = x + cos(direction)*45 ;
    float yInFront = y + sin(direction)*45 ;
    if(inHand != null) {
      //Drop part of the method
      for (Container c : containers) {
         if (c != inHand && dist(xInFront,yInFront,c.x,c.y) <= radius) {
           if (! c.putOn(inHand)) {
             return false;
            }
            inHand = null;
            return true;
         }
       }
       for (Tile t : tiles) {
          if ((t.x1 < xInFront) && (t.x2 > xInFront) && (t.y1 < yInFront) && (t.y2 > yInFront)) {
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
          if ((t.x1 < xInFront) && (t.x2 > xInFront) && (t.y1 < yInFront) && (t.y2 > yInFront)) {
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
  
  void interact(ArrayList<ProcessingTile> pTiles, ArrayList<Item> items) {
   for (ProcessingTile pT : pTiles) {
     float xInFront = x + cos(direction)*55 ;
     float yInFront = y + sin(direction)*55 ;
     if ((pT.x1 < xInFront) && (pT.x2 > xInFront) && (pT.y1 < yInFront) && (pT.y2 > yInFront)) {
        pT.process(items); 
     }
   }
  }
  
}
