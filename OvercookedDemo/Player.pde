public class Player {
  float x, y;
  float radius;
  Item inHand;
  float direction = 3 * (float)Math.PI / 2;
  boolean colliding;
  int busy;
  int dashing; 
  int duration;
  color c ;
  boolean active ;
  
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
    //body
    fill(c);
    ellipse(x, y, radius*2, radius*2);
    //eyes
    fill(0) ;
    ellipse(x+cos(direction-radians(20))*22.5,y+sin(direction-radians(20))*22.5,5,5) ;
    ellipse(x+cos(direction+radians(20))*22.5,y+sin(direction+radians(20))*22.5,5,5) ;
    //hat
    fill(color(255));
    if (! active) fill(#E8E8E8) ;
    
    ellipse(x, y, radius*1.3, radius*1.3);
    if (inHand != null) {
       inHand.setXY(x + cos(direction) * radius, y + sin(direction) * radius); 
       inHand.changeRotation(direction) ;
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
    if (inHand != null && dist(inHand.x, inHand.y, x, y) > 65) {
      inHand = null;  
    }
  }
  
  void move (float dx, float dy, float d, ArrayList<Tile> tiles, Player p) {
    if (busy < 0) {
     x += dx;
     y += dy;
     if (dashing > 0) {
       x += dx;
       y += dy;
     }
     direction = d;
     collide(tiles,p) ;
     dashing--;
    }
  }
 
    void collide(ArrayList<Tile> tiles, Player p) {
    int d = 1;
    if (dashing > 0) {
      d++;  
    }
    for (Tile t: tiles) {
      float testX = x + cos(direction) * radius;
      float testY = y + sin(direction) * radius;
      boolean colliding = testX >= t.x1 && testX <= t.x2 && testY >= t.y1 && testY <= t.y2;
      colliding = colliding || (dist(p.x,p.y,this.x,this.y) <= radius * 2) ;
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
              } else {
                inHand = null;
                return true;
              }
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
              return false;
              //doesn't matter if it returns true or not 
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
  
  boolean interact(ArrayList<ProcessingTile> pTiles, ArrayList<Item> items) {
   if (busy < 0) {
     float xInFront = x + cos(direction)*55 ;
     float yInFront = y + sin(direction)*55 ;
     if (inHand != null && inHand.name.equals("fire_extinguisher")) {
       for(Tile t : tiles) {
         if (t.onFire && dist(xInFront, yInFront, (t.x2 + t.x1)/2, (t.y2 + t.y1)/2) <= radius*5) {
            t.onFire = false; 
            imageMode(CENTER) ;
            image(loadImage("spray.png"),xInFront,yInFront);
            imageMode(CORNER) ;
            return true;
         }
       }
     }
     for (ProcessingTile pT : pTiles) {
       if ((pT.x1 < xInFront) && (pT.x2 > xInFront) && (pT.y1 < yInFront) && (pT.y2 > yInFront)) {
          pT.process(items,this); 
          return true;
       }
     }
   }
   return true;
  }
  
}
