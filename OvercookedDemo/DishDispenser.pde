public class DishDispenser extends Tile {
  
  int limit = 100;
  ArrayList<Container> containers;
  ArrayList<Item> items;
  
  DishDispenser(float x1,float y1,float x2,float y2, ArrayList<Container> containers,  ArrayList<Item> items) {
    super(125,x1,y1,x2,y2) ;
    this.containers = containers;
    this.items = items;
  }
  
  DishDispenser(color c, float x1,float y1,float x2,float y2, ArrayList<Container> containers,  ArrayList<Item> items, int limit) {
    super(c,x1,y1,x2,y2) ;
    this.limit = limit;
    this.containers = containers;
    this.items = items;
  }
  
  void display() {
    stroke(0);
    fill(c) ;
    rect(x1,y1,x2-x1,y2-y1) ;
    if (limit > 0) {
      fill(255);
      ellipse((x2+x1)/2, (y2+y1)/2, width / 20, width / 20);
    }
  }
  
   boolean putOn(Item a) {
    return false ;
  }
  
  Container retrieve() {
    Container temp = null;
    if (limit > 0) {
      temp = new Container((x2+x1)/2,(y2+y1)/2,255,"plate");
      containers.add(temp);
      items.add(0,temp);
      limit--;
      return temp;
    }
    return temp; 
  }
 
}
