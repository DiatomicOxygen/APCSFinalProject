public class Container extends Item {
 
  //PImage img TO BE IMPLEMENTED
  ArrayList<Item> ingredients;
  
  Container(float x, float y, color c, String name) {
    super(x,y,c);
    this.name = name;
    ingredients = new ArrayList<Item>();
  }
  
  void display() {
     super.display();
     for (Item i : ingredients) {
       i.setXY(x,y);  
     }
  }
  
  
  boolean equals(Container c) { 
    if (this.ingredients.size() == c.ingredients.size() && this.name.equals(c.name)) {
      if (ingredients.size() == 1) {
        return this.ingredients.get(0).equals(c.ingredients.get(0));  
      }
      if (ingredients.size() == 2) {
        Item t1 = this.ingredients.get(0);
        Item t2 = this.ingredients.get(1);
        Item c1 = c.ingredients.get(0);
        Item c2 = c.ingredients.get(1);
        return (t1.equals(c1) && t2.equals(c2)) || (t2.equals(c1) && t1.equals(c2));
      }
      if (ingredients.size() == 3) {
        Item t1 = this.ingredients.get(0);
        Item t2 = this.ingredients.get(1);
        Item t3 = this.ingredients.get(2);
        Item c1 = c.ingredients.get(0);
        Item c2 = c.ingredients.get(1);
        Item c3 = c.ingredients.get(2);
        return (t1.equals(c1) && t2.equals(c2) && t3.equals(c3))
        || (t1.equals(c1) && t2.equals(c3) && t3.equals(c2))
        || (t1.equals(c2) && t2.equals(c1) && t3.equals(c3))
        || (t1.equals(c2) && t2.equals(c3) && t3.equals(c1))
        || (t1.equals(c3) && t2.equals(c2) && t3.equals(c1))
        || (t1.equals(c3) && t2.equals(c1) && t3.equals(c2));
      }
    }
    return false;
  }  
  
  boolean putOn(Item i) {
    if (ingredients.size() == 3 || i.name == null || i.name.equals("pot") || i.name.equals("pan") || i.name.equals("plate") || this.name.equals("dirtyPlate")) {
      return false; 
    }
    i.setXY(x,y);
    i.radius = width / 50;
    ingredients.add(i);
    return true;
  }
}
