public class Garbage extends Tile {
 
  ArrayList<Container> containers;
  ArrayList<Item> items;
  
  Garbage(float x1, float y1, float x2, float y2, ArrayList<Container> containers, ArrayList<Item> items) {
    super(125,x1,y1,x2,y2) ;
    this.containers = containers;
    this.items = items;
  }
  
  void display() {
    stroke(0) ;
    fill(c) ;
    rect(x1,y1,x2-x1,y2-y1) ;
    fill(0);
    rect(x1+10,y1+10,x2-x1-20,y2-y1-20) ;
  }
  
  boolean putOn(Item a) {
    int containerIndex = containers.indexOf(a);
    if (containerIndex > -1) {
      ArrayList<Item> trash = containers.get(containerIndex).ingredients;
      for (int i = trash.size()-1; i >= 0; i--) {
        items.remove(trash.get(i));
        trash.remove(i);  
      }
      return false;
      //want it to be false so that inHand does not get cleared
    }
    items.remove(a);
    return true;
  }
  
  Item retrieve() {
    return null;  
  }
  
  
}
