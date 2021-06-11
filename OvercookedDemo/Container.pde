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
     image(loadImage(name + ".png"),x,y) ;
     for (int i = 0; i < ingredients.size(); i++) {
       String imgName = ingredients.get(i).name ;
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
    if (ingredients.size() == 3 || i.name == null || i.name.equals("pot")  || i.name.equals("plate") || i.name.equals("dirty_plate") || this.name.equals("dirty_plate")) {
      return false; 
    }
    if (i.name.equals("pan")) {
      return putOn((Pan)(Container) i);
    }
    return putOn((Ingredient) i) ;
  }
  
  boolean putOn(Ingredient i) {
    for (Ingredient a : ingredients) {
      if (i.name.equals(a.name)) return false ;
    }
    if (!(i.isCut) && i.isCuttable) return false ;
    if (i.isCookable) return false ;
    i.setXY(x,y);
    i.radius = width / 50;
    if (i.name.equals("cut_cabbage")) ingredients.add(0,i);
    else if (i.name.equals("cooked_cut_meat")) ingredients.add(0,i);
    else if (i.name.equals("cut_tomato") && ingredients.size() > 0) ingredients.add(1,i);
    else ingredients.add(i);
    i.visible = false ;
    return true;
  }
  
  boolean putOn(Pan i) {
    if (i.ingredients.size() > 0 && putOn((Ingredient)i.ingredients.get(0))) {
       i.ingredients.remove(0);
       return false;   
    }
    return false;
  }
}
