public class Pan extends Container {
 
  Ingredient ingredient;
  
  Pan(float x, float y, color c, String name) {
    super(x,y,c,name);
    radius = width/42;
  }
  
  void display() {
     imageMode(CENTER) ;
     image(loadImage(name + ".png"),x,y) ;
     if (ingredient != null) {
       String imgName = ingredient.name ;
       imageMode(CENTER) ;
       imgName += "_container";
       if (rotation == 3 * (float)Math.PI / 2) {
         imgName += "_0" ;
       }
       if (rotation == 7 * (float)Math.PI / 4) {
         imgName += "_1" ;
       }
       if (rotation == 0) {
         imgName += "_2" ;
       }
       if (rotation == 1 * (float)Math.PI / 4) {
         imgName += "_3" ;
       }
       if (rotation == (float)Math.PI / 2) {
         imgName += "_4" ;
       }
       if (rotation == 3 * (float)Math.PI / 4) {
         imgName += "_5" ;
       }
       if (rotation == (float)Math.PI) {
         imgName += "_6" ;
       }
       if (rotation == 5 * (float)Math.PI / 4) {
         imgName += "_7" ;
       }
       imgName += ".png";
       image(loadImage(imgName),x,y);
       imageMode(CORNER) ;
     }
     imageMode(CORNER) ;
  }
 
  
  boolean equals(Item b) {
    return this.name.equals(b.name); 
  }
  
  boolean putOn(Item i) {
    if (ingredient != null || i.name == null || i.name.equals("pot")  || i.name.equals("plate") || i.name.equals("pan") || i.name.equals("dirty_plate")) {
      return false; 
    }
    return putOn((Ingredient) i) ;
  }
  
  boolean putOn(Ingredient i) {
    if (!(i.isCookable)) return false ;
    ingredients.add(i);
    ingredient = i;
    i.setXY(x,y);
    i.radius = width / 50;
    i.visible = false ;
    return true;
  }
  
  
}
