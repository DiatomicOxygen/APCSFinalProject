public class Sink extends ProcessingTile {
  
  ArrayList<Item> dirtyDishes = new ArrayList<Item>();
  ArrayList<Item> cleanDishes = new ArrayList<Item>();
  
  Sink(float x1,float y1,float x2,float y2) {
    super(200,x1,y1,x2,y2);
  }
  
  void display() {
    stroke(0) ;
    fill(c) ;
    rect(x1,y1,x2-x1,y2-y1) ;
    fill(color(#5bb1cd));
    rect(x1+10,y1+10,x2-x1-20,y2-y1-20) ;
  }
  
  boolean putOn(Item a) {
    if (dirtyDishes.size() < 3) {
      if (a.name.equals("dirty_plate")) {
        a.setXY((x2-x1)/3+x1 + dirtyDishes.size() * 3,(y2-y1)/2+y1) ;  
        dirtyDishes.add(a); 
        a.radius = width/45;
      }
      return true;
    }
    return false;
  }
  
  Item retrieve() {
    if (cleanDishes.size() == 0) {
      return null;  
    }
    Item ans = cleanDishes.remove(cleanDishes.size()-1);
    ans.radius = width/42;
    return ans;
  }
  
  void process(ArrayList<Item> items, Player p) {
    if (cleanDishes.size() < 3 && dirtyDishes.size() > 0) {
      p.busy = 60 ;
      p.duration = 60 ;
      Item c = dirtyDishes.remove(dirtyDishes.size()-1);
      c.name = "plate";
      c.c = 255;
      c.setXY(2 * (x2-x1)/3+x1 + cleanDishes.size() * 3,(y2-y1)/2+y1) ;  
      cleanDishes.add(c);
    }
  }
  
}
