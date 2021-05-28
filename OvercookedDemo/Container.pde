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
    if (this.ingredients.size() == c.ingredients.size()) {
      for (int i = 0; i < this.ingredients.size(); i++) {
         if (this.ingredients.get(i).equals(c.ingredients.get(i))) {
           return false;
         }
      }
      return true;
    }
    return false;
  }  
  
  boolean putOn(Item i) {
    if (ingredients.size() == 3 || i.name == null || i.name.equals("pot") || i.name.equals("pan") || i.name.equals("plate")) {
      return false; 
    }
    i.setXY(x,y);
    i.radius = width / 50;
    ingredients.add(i);
    return true;
  }
}
