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
     imageMode(CENTER) ;
     image(loadImage("plate.png"),x,y) ;
     for (int i = 0; i < ingredients.size(); i++) {
       String name = ingredients.get(i).name ;
       imageMode(CENTER) ;
       if (name.equals("cut_cabbage")) {
          if (rotation == 3 * (float)Math.PI / 2) {
            image(loadImage("cabbage_plate_0.png"),x,y) ;
          }
          if (rotation == 7 * (float)Math.PI / 4) {
            image(loadImage("cabbage_plate_1.png"),x,y) ;
          }
          if (rotation == 0) {
            image(loadImage("cabbage_plate_2.png"),x,y) ;
          }
          if (rotation == 1 * (float)Math.PI / 4) {
            image(loadImage("cabbage_plate_3.png"),x,y) ;
          }
          if (rotation == (float)Math.PI / 2) {
            image(loadImage("cabbage_plate_4.png"),x,y) ;
          }
          if (rotation == 3 * (float)Math.PI / 4) {
            image(loadImage("cabbage_plate_5.png"),x,y) ;
          }
          if (rotation == (float)Math.PI) {
            image(loadImage("cabbage_plate_6.png"),x,y) ;
          }
          if (rotation == 5 * (float)Math.PI / 4) {
            image(loadImage("cabbage_plate_7.png"),x,y) ;
          }
          
          imageMode(CORNER) ;
       }
        if (name.equals("cut_tomato")) {
          imageMode(CENTER) ;
          if (rotation == 3 * (float)Math.PI / 2) {
            image(loadImage("tomato_plate_0.png"),x,y) ;
          }
          if (rotation == 7 * (float)Math.PI / 4) {
            image(loadImage("tomato_plate_1.png"),x,y) ;
          }
          if (rotation == 0) {
            image(loadImage("tomato_plate_2.png"),x,y) ;
          }
          if (rotation == 1 * (float)Math.PI / 4) {
            image(loadImage("tomato_plate_3.png"),x,y) ;
          }
          if (rotation == (float)Math.PI / 2) {
            image(loadImage("tomato_plate_4.png"),x,y) ;
          }
          if (rotation == 3 * (float)Math.PI / 4) {
            image(loadImage("tomato_plate_5.png"),x,y) ;
          }
          if (rotation == (float)Math.PI) {
            image(loadImage("tomato_plate_6.png"),x,y) ;
          }
          if (rotation == 5 * (float)Math.PI / 4) {
            image(loadImage("tomato_plate_7.png"),x,y) ;
          }
          
          imageMode(CORNER) ;
       }
      imageMode(CORNER) ;  
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
    i.visible = false ;
    return true;
  }
}
