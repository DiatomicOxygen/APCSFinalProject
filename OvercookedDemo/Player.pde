public class Player {
  float x, y;
  float radius;
  Item inHand;
  float direction = 0;
  boolean colliding;
  int busy;
  int dashing; 
  int duration;
  color c ;
  
  Player(float x, float y, float width, color c) {
    this.x = x;
    this.y = y;
    radius = width / 40;
    busy = -1 ;
    dashing = -50;
    this.c = c ;
  }
  
  void display() {
    stroke(0);
    fill(c);
    ellipse(x, y, radius*2, radius*2);
    line(x,y,x + cos(direction) * radius, y + sin(direction) * radius);
    fill(color(255));
    ellipse(x, y, radius*1.3, radius*1.3);
    if (inHand != null) {
       inHand.setXY(x + cos(direction) * radius, y + sin(direction) * radius); 
    }
    if (busy > 0) {
      fill(255) ;
      rect(x+25,y-25,50,-10) ;
      colorMode(HSB,359,100,100) ;
      color c = color(100 - 100 * (busy)/duration-10,90,90) ;
      fill(c) ;
      rect(x+27,y-27,46*((float)(duration - busy)/duration),-6) ;
    }
    colorMode(RGB,255,255,255) ;
    busy--;
  }
  
  void move (float dx, float dy, float d, ArrayList<Tile> tiles) {
    if (busy < 0) {
     x += dx;
     y += dy;
     if (dashing > 0) {
       x += dx;
       y += dy;
     }
     direction = d;
     collide(tiles) ;
     dashing--;
    }
  }
 
    void collide(ArrayList<Tile> tiles) {
    int d = 1;
    if (dashing > 0) {
      d++;  
    }
    for (Tile t: tiles) {
      float testX = x + cos(direction) * radius;
      float testY = y + sin(direction) * radius;
      boolean colliding = testX >= t.x1 && testX <= t.x2 && testY >= t.y1 && testY <= t.y2;
      if (colliding) {
        x -= cos(direction) * 5 * d;
        y -= sin(direction) * 5 * d;
      }
    }

  }
  
  boolean pickUpDrop(ArrayList<Tile> tiles, ArrayList<Item> items, ArrayList<Container> containers) {
    if (busy < 0) {
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
            if(dist(i.x, i.y, x, y) <= radius * 1.5 || 
            dist(i.x, i.y, xInFront, yInFront) <= radius * 2) {
              inHand = i;
              return true;
            } 
         }
      }
      return false;
    }
    return false;
  }
  
  void interact(ArrayList<ProcessingTile> pTiles, ArrayList<Item> items) {
   if (busy < 0) {
     for (ProcessingTile pT : pTiles) {
       float xInFront = x + cos(direction)*55 ;
       float yInFront = y + sin(direction)*55 ;
       if ((pT.x1 < xInFront) && (pT.x2 > xInFront) && (pT.y1 < yInFront) && (pT.y2 > yInFront)) {
          pT.process(items,this); 
          
       }
     }
   }
  }
  
}
