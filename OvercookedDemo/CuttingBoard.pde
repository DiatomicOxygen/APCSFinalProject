public class CuttingBoard extends ProcessingTile {
  
  Ingredient onTop ;
  
  CuttingBoard(color c, float x1, float y1, float x2, float y2) {
    super(c,x1,y1,x2,y2) ;
  }

  void display() {
    super.display();
    fill(255);
    triangle(x1 + (x2-x1)/8, y1 + (y2 - y1)/8, 
    x1 + (x2-x1)/8, y1 + 5 * (y2 - y1)/8, 
    x1 + 3 * (x2-x1)/8, y1 + 5 * (y2 - y1)/8);
    fill(0);
    rect(x1 + (x2-x1)/8, y1 + 5 * (y2 - y1)/8, (x2-x1)/8, 2 * (y2 - y1)/8 );
  }
  
  boolean putOn(Item a) {
    if (a.name != "plate") {
      return putIngredientOn((Ingredient) a) ;
    }
    return false ;
  }
  
  boolean putIngredientOn(Ingredient a) {
    if (empty) {
      onTop = a ;
      empty = false ;
      a.setXY((x2-x1)/2+x1,(y2-y1)/2+y1) ;
      return true ;
    }
    return false ;
  }
  
  Item retrieve() {
    Ingredient temp = onTop ;
    onTop = null;
    empty = true;
    return temp;
  }
  
  void process(ArrayList<Item> items, Player p) {
    if ((!(empty)) && (onTop.isCuttable)) {
      p.busy = 120 ;
      p.duration = 120 ;
      onTop.isCut = true ;
      onTop.isCuttable = false ;
      onTop.name = "cut_" + onTop.name ;
    }
    
  }
  
  
}
