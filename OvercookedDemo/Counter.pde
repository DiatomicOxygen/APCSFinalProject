public class Counter extends Tile {
  
  ArrayList<Container> containers;
  ArrayList<Item> items;
  ArrayList<Order> orders;
  boolean easyMode = true;
  
  Counter(float x1,float y1,float x2,float y2, ArrayList<Container> containers, ArrayList<Item> items, ArrayList<Order> orders) {
    super(255, x1, y1, x2, y2);
    this.orders = orders;
    this.items = items;
    this.containers = containers;
  }
  
  void display() {
    super.display();
    fill(125);
    triangle(x1 + (x2 - x1)/8, y1 + (y2 - y1)/4, 
    x1 + (x2 - x1)/8, y1 + 3 * (y2 - y1)/4,
    x1 + (x2 - x1)/2, y1 + (y2 - y1)/2 );
    
    triangle(x1 + 5 * (x2 - x1)/8, y1 + (y2 - y1)/4, 
    x1 + 5 * (x2 - x1)/8, y1 + 3 * (y2 - y1)/4,
    x2, y1 + (y2 - y1)/2 );
  }
  
  boolean putOn(Item a) {
    if (empty == false) {
      return false;  
    }
    int containerIndex = containers.indexOf(a);
    if (containerIndex > -1) {
      Container c = containers.get(containerIndex);
      for (Order o : orders) {
        if (c.equals(o.container)) {
          o.reward();
          for (int i = c.ingredients.size()-1; i >= 0; i--) {
            items.remove(c.ingredients.get(i));
            c.ingredients.remove(i);  
          }
          if (easyMode) {
            containers.remove(containerIndex);
            items.remove(c);
            this.i = null;
            empty = true;
            return true;
          }
          c.name = "dirty_plate";
          c.c = color(165, 42, 42);
          i = c;
          i.setXY((x2-x1)/2+x1,(y2-y1)/2+y1) ;
          empty = false;
          return true;
        }
      }
    }
    return false;  
  }
  
  //retrieve method is the same
  
}
