public class Stove extends ProcessingTile {
 
  Container pan;
  int cooking;
  boolean onFire = false;
  
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
    if (pan != null && pan.ingredients.size() > 0 && cooking >= 0) {
      fill(255) ;
      float x = (x1 + x2) / 2;
      float y = (y1 + y2) / 2 - 8;
      rect(x+25,y-25,50,-10) ;
      colorMode(HSB,359,100,100) ;
      color c = color(100 - 100 * (cooking)/180-10,90,90) ;
      fill(c) ;
      rect(x+27,y-27,46*((float)(180 - cooking)/180),-6) ;
      colorMode(RGB,255,255,255);
    }
    if (cooking < -60) {
      fill(255,0,0,95);
      ellipse((x1+x2)/2, y1 - 24, 8, 20);
      ellipse((x1+x2)/2, y1 - 8, 8, 8);
    }
    if (onFire) {
      imageMode(CENTER) ;
      if (cooking % 10 < -5) {
        image(loadImage("fire_1.png"),(x1+x2)/2,(y1+y2)/2 - 30);
      } else {
        image(loadImage("fire_2.png"),(x1+x2)/2,(y1+y2)/2 - 30);
      }
      imageMode(CORNER) ;
    }
    process();
  }
  
   boolean putOn(Item a) {
    if (a.name.equals("pan") && !onFire && empty) {
      Container c = (Container)a;
      if(c.ingredients.size() > 0 && ! c.ingredients.get(0).isCookable) return false;
      pan = c;
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
    cooking = 0;
    Container temp = pan;
    pan = null;
    empty = true;
    return temp;
  }
  
  void process() {
    if (pan != null && pan.ingredients.size() > 0) {
      cooking--;
      if (cooking == 0) {
        Ingredient i = pan.ingredients.get(0);
        i.name = "cooked_" + i.name;
        i.isCookable = false;
      }
      if (cooking == -210) {
        onFire = true;
        Ingredient i = pan.ingredients.get(0);
        i.name = "burnt";
        i.rotation = 3 * (float)Math.PI / 2;
        i.c = 0;
        i.isCut = false;
      }
    }
  }
  
}
