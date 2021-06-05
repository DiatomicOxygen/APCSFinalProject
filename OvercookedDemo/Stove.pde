public class Stove extends ProcessingTile {
 
  Container pan;
  int cooking;
  boolean onFire;
  
  Stove(float x1, float y1, float x2, float y2) {
    super(160,x1,y1,x2,y2) ;
  }
  
  void display() {
    super.display();
    fill(20);
    ellipse((x1+x2)/2, (y1+y2)/2, (x1-x2)/1.5 ,(y1-y2)/1.5 );
    fill(0,0,255);
    for (int i = 0; i < 8; i++) {
      ellipse((x1+x2)/2 + 10 * cos(i * PI / 4), (y1+y2)/2 + 10 * sin(i * PI / 4), 5,9);
    }
    if (cooking < 0) {
      fill(255,0,0,95);
      ellipse((x1+x2)/2, y1 - 24, 8, 20);
      ellipse((x1+x2)/2, y1 - 8, 8, 8);
    }
    if (onFire) {
      fill(255,0,0);
      ellipse((x1+x2)/2, (y1+y2)/2 + 10, (x1-x2)/1.5 ,(y1-y2)/1.5 );  
    }
    process();
  }
  
   boolean putOn(Item a) {
    if (a.name.equals("pan") && !onFire) {
      pan = (Container)a;
      empty = false ;
      pan.setXY((x2-x1)/2+x1,(y2-y1)/2+y1) ;
      cooking = 180;
      return true;
    }
    return false ;
  }
  
  Item retrieve() {
    if (onFire) {
      return null;  
    }
    Item temp = pan;
    pan = null;
    empty = true;
    return temp;
  }
  
  void process() {
    if (pan != null && pan.ingredients.size() > 0) {
      cooking--;
      if (cooking == 0) {
        for (Ingredient i : pan.ingredients) {
          i.name = "cooked_" + i.name;
        }
      }
      if (cooking == -90) {
        onFire = true;
        for (Ingredient i : pan.ingredients) {
         i.name = "burnt";
         i.c = 0;
         i.isCut = false;
        }
      }
    }
  }
  
}
