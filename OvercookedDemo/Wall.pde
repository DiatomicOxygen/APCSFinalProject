public class Wall extends Tile {

  Wall(color c, float x1,float y1,float x2,float y2) {
    super(c,x1,y1,x2,y2) ;
    empty = true ;
  }
  
  void display() {
    stroke(0) ;
    fill(c) ;
    rect(x1,y1,x2-x1,y2-y1) ;
  }
  
   boolean putOn(Item a) {
    return false ;
  }
  
}
