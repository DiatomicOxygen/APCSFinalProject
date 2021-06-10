public class Crate extends ProcessingTile {
  Ingredient type ;
  
  Crate(Ingredient type, color c, float x1,float y1,float x2,float y2) {
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
    fill(255);
    ellipse((x2+x1)/2, (y2+y1)/2, width / 20, width / 20);
    imageMode(CENTER) ;
    image(loadImage("crate_" + type.name + ".png"),(x2+x1)/2,(y2+y1)/2) ;
    imageMode(CORNER) ;
    if (type == null) {
      fill(type.getColor());
      ellipse((x2+x1)/2, (y2+y1)/2, width / 30, width / 30);
    }
  }
  
   boolean putOn(Item a) {
    return false ;
  }
  
  //uses super.retrieve();
  
  void process(ArrayList<Item> items, Player p) {
    if (empty) {
      this.i = new Ingredient((x2+x1)/2,(y2+y1)/2,type.getColor(),type.name,type.isCuttable,type.isCookable);
      items.add(i);
      empty = false;
    }
  }
 
}
