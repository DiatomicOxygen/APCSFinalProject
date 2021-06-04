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
    if (visible) {
      if (name.equals("cabbage")) {
        imageMode(CENTER) ;
        image(loadImage("cabbage.png"),x,y) ;
        imageMode(CORNER) ;
      }
      else if (name.equals("tomato")) {
        imageMode(CENTER) ;
        image(loadImage("tomato.png"),x,y) ;
        imageMode(CORNER) ;
      }
      else if (name.equals("cut_cabbage")) {
        imageMode(CENTER) ;
          if ((rotation == 3 * (float)Math.PI / 2) || (rotation == 1 * (float)Math.PI / 2)) {  
            image(loadImage("cut_cabbage_0.png"),x,y) ;
          }
          if ((rotation == 0) || (rotation == (float)Math.PI)) {
            image(loadImage("cut_cabbage_1.png"),x,y) ;
          }
          if ((rotation == 5 * (float)Math.PI / 4) || (rotation == (float)Math.PI / 4)) {
            image(loadImage("cut_cabbage_2.png"),x,y) ;
          }
          if ((rotation == 7 * (float)Math.PI / 4) || (rotation == 3 * (float)Math.PI / 4)) {
            image(loadImage("cut_cabbage_3.png"),x,y) ;
          }
          imageMode(CORNER) ;
      }       
      else {
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
