public class Ingredient extends Item {
 
  String name; 
  //PImage img TO BE IMPLEMENTED
  boolean isCuttable, isCookable;
  
  Ingredient(float x, float y, color c, String name) {
    super(x,y,c);
    this.name = name;
  }
  
  //Different diplay method to be implemented
  
  boolean equals(Ingredient b) {
     return this.name.equals(b.name); 
  }
  
}
