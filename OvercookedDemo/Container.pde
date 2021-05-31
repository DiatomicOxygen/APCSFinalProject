public class Container extends Item {
 
  //PImage img TO BE IMPLEMENTED
  ArrayList<Ingredient> ingredients;
  
  Container(float x, float y, color c, String name) {
    super(x,y,c);
    this.name = name;
    ingredients = new ArrayList<Ingredient>();
    radius = width/42;
  }
  
  void display() {
     super.display();
     for (int i = 0; i < ingredients.size(); i++) {
       ingredients.get(i).setXY(x+(i-1)*3,y);  
     }
  }
  
  
  boolean equals(Container c) { 
    if (this.ingredients.size() == c.ingredients.size() && this.name.equals(c.name)) {
      if (ingredients.size() == 1) {
        return this.ingredients.get(0).equals(c.ingredients.get(0));  
      }
      if (ingredients.size() == 2) {
        Ingredient t1 = this.ingredients.get(0);
        Ingredient t2 = this.ingredients.get(1);
        Ingredient c1 = c.ingredients.get(0);
        Ingredient c2 = c.ingredients.get(1);
        return (t1.equals(c1) && t2.equals(c2)) || (t2.equals(c1) && t1.equals(c2));
      }
      if (ingredients.size() == 3) {
        Ingredient t1 = this.ingredients.get(0);
        Ingredient t2 = this.ingredients.get(1);
        Ingredient t3 = this.ingredients.get(2);
        Ingredient c1 = c.ingredients.get(0);
        Ingredient c2 = c.ingredients.get(1);
        Ingredient c3 = c.ingredients.get(2);
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
    if (ingredients.size() == 3 || i.name == null || i.name.equals("pot") || i.name.equals("pan") || i.name.equals("plate") || i.name.equals("dirty_plate") || this.name.equals("dirty_plate")) {
      return false; 
    }
    return putOn((Ingredient) i) ;
  }
  
  boolean putOn(Ingredient i) {
    for (Ingredient a : ingredients) {
      if (i.name.equals(a.name)) return false ;
    }
    if ((i.name.equals("cabbage")) && (!(i.isCut ))) return false ;
    i.setXY(x,y);
    i.radius = width / 50;
    ingredients.add(i);
    return true;
  }
}
