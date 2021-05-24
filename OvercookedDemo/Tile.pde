public class Tile {
  float x1,y1,x2,y2 ;
  PImage image ;
  color c ;
  Item i ;
  boolean empty ;
  
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
    rect(x1,y1,x2-x1,y2-y1) ;
    if (!(empty)) i.display() ;
  }
  
  boolean putOn(Item a) {
    
    return false ;
  }
  
  Item retrieve() {
    Item temp = i;
    i = null;
    empty = true;
    return temp;
  }
}
