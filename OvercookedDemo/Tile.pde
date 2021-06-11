public class Tile {
  float x1,y1,x2,y2 ;
  PImage image ;
  color c ;
  Item i ;
  boolean empty ;
  boolean onFire = false;
  
  Tile(color c, float x1,float y1,float x2,float y2) {
    this.c = c ;
    this.x1 = x1 ;
    this.x2 = x2 ;
    this.y1 = y1 ;
    this.y2 = y2 ;
    empty = true ;
  }
  

  
  void display() {
    stroke(0) ;
    fill(c) ;
    rect(x1,y1,x2-x1,y2-y1) ;
    if (i != null) {
      i.setXY((x2-x1)/2+x1,(y2-y1)/2+y1) ;
    }
  }
  
  boolean putOn(Item a) {
    if (empty) {
      i = a ;
      empty = false ;
      i.setXY((x2-x1)/2+x1,(y2-y1)/2+y1) ;
      return true ;
    }
    return false ;
  }
  
  Item retrieve() {
    if (!empty) {
      Item temp = i;
      i = null;
      empty = true;
      return temp;
    } 
    return null;
  }
}
