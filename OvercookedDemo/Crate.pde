public class Crate extends ProcessingTile {
  Item type ;
  
  Crate(Item type, color c, float x1,float y1,float x2,float y2) {
    super(c,x1,y1,x2,y2) ;
    this.type = type ;
    empty = true ;
  }
  
  Item getType() {
    return type ;
  }
  
  void display() {
    stroke(0);
    fill(c) ;
    rect(x1,y1,x2-x1,y2-y1) ;
    fill(type.getColor());
    ellipse((x2+x1)/2, (y2+y1)/2, width / 20, width / 20);
  }
  
   boolean putOn(Item a) {
    return false ;
  }
  
  //uses super.retrieve();
  
  void process(ArrayList<Item> items) {
    if (empty) {
      this.i = new Item(0,0,type.getColor());
      items.add(i);
      empty = false;
    }
  }
  
}
