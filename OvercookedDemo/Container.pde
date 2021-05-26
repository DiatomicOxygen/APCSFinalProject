public class Container extends Item {
 
  String name; 
  //PImage img TO BE IMPLEMENTED
  ArrayList<Ingredient> ingredients;
  
  Container(float x, float y, color c, String name) {
    super(x,y,c);
    this.name = name;
    ingredients = new ArrayList<Ingredient>();
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
  
  boolean putOn(Ingredient i) {
    if (ingredients.size() == 3) {
      return false; 
    }
    ingredients.add(i);
    return true;
  }
}
