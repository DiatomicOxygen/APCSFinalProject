public class Ingredient extends Item {
 
  //PImage img TO BE IMPLEMENTED
  boolean isCuttable, isCookable, isCut, isCooked ;
  
  Ingredient(float x, float y, color c, String name, boolean isCuttable, boolean isCookable) {
    super(x,y,c);
    this.name = name;
    this.isCuttable = isCuttable ;
    this.isCookable = isCookable ;
  }
  
  void display() {
    if (visible) {
      String imgName = name;
      if (isCut) {
        if ((rotation == 3 * (float)Math.PI / 2) || (rotation == 1 * (float)Math.PI / 2)) {  
          imgName += "_0" ;
        }
        if ((rotation == 0) || (rotation == (float)Math.PI)) {
          imgName += "_1" ;
        }
        if ((rotation == 5 * (float)Math.PI / 4) || (rotation == (float)Math.PI / 4)) {
          imgName += "_2" ;
        }
        if ((rotation == 7 * (float)Math.PI / 4) || (rotation == 3 * (float)Math.PI / 4)) {
          imgName += "_3" ;
        }
      }
      imageMode(CENTER) ;
      imgName += ".png";
      image(loadImage(imgName),x,y);
      imageMode(CORNER) ;     
      if (name.equals("")) {
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
  }
 
  
}
