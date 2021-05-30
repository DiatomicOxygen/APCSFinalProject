public class Ingredient extends Item {
 
  //PImage img TO BE IMPLEMENTED
  boolean isCuttable, isCookable, isCut ;
  
  Ingredient(float x, float y, color c, String name, boolean isCuttable, boolean isCookable) {
    super(x,y,c);
    this.name = name;
    this.isCuttable = isCuttable ;
    this.isCookable = isCookable ;
    isCut = false ;
  }
  
  void display() {
    stroke(0);
    fill(c);
    ellipse(x, y, radius*2, radius*2);
    if (isCut) {
      fill(0);
      line(x,y-radius,x,y+radius) ;
      line(x-radius/1.4142,y-radius/1.4142,x-radius/1.4142,y+radius/1.4142) ;
      line(x+radius/1.4142,y-radius/1.4142,x+radius/1.4142,y+radius/1.4142) ;
    }
  }
 
  
}
