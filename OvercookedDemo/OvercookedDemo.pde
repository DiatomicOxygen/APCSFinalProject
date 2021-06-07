ArrayList<Tile> tiles = new ArrayList<Tile>();
ArrayList<Item> items = new ArrayList<Item>();
ArrayList<Container> containers = new ArrayList<Container>();
ArrayList<ProcessingTile> pTiles = new ArrayList<ProcessingTile>();
ArrayList<Order> orders = new ArrayList<Order>();
float WIDTH = 1080;
float HEIGHT = 720;
int hours = 0 ;
int minutes = 0 ;
int seconds = 0 ;
int timer = 300 ;
int[] score = new int[1]; 
Player P1 ;
Player P2 ;
boolean orderAdded = false ;
boolean wPressed = false; 
boolean aPressed = false; 
boolean sPressed = false; 
boolean dPressed = false; 
int activePlayer = 0 ;
int screen = -1 ;

void setup() {
  frameRate(30);
  size(1080,720) ;
}

void draw() {
  if (screen == -1) {
    background(#54649D) ; 
    image(loadImage("Logo.png"),0,0) ;
    fill(0) ;
    textSize(50) ;
    if (((second() % 5) == 0) || ((second() % 5) == 1)) fill(255) ;
    text("PRESS SPACE TO START",270,500) ;
  }
  if (screen != -1) {
    background(230) ; 
    int timeElapsed = (hour() - hours) * 3600 + (minute() - minutes) * 60 + (second() - seconds) ;
    if (timer - timeElapsed < 0) timeElapsed = timer ;
    inGameDisplay(timeElapsed);
    if (timer == timeElapsed) {
      gameOverDisplay();  
    }
  }
} 
  

void keyPressed() {
  if ((screen == -1) && (key == ' ')) {
    screen = 1 ;
    demo(tiles, pTiles,containers, orders) ;
  }
  if (screen != -1) {
    if (key == 'r') {
      println(activePlayer) ;
      boolean changed = false ;
      if ((activePlayer == 1) && ! changed) {
         activePlayer = 2 ;
         P1.active = false ;
         P2.active = true ;
         changed = true ;
      }
      if ((activePlayer == 2) && ! changed) {
         activePlayer = 1 ;
         P2.active = false ;
         P1.active = true ;
         changed = true ;
      }
    }
    Player p = P1 ;
    if (activePlayer == 2) {
      p = P2 ;
    }
    if (key == 'q') {
      p.interact(pTiles, items); 
    }
    if (key == 'e') {
      p.pickUpDrop(tiles, items, containers);
    }
    if (key == ' ') {
      if (p.dashing < -50) {
        p.dashing = 10;  
      }
    }
    if (key == 'w') {
      wPressed = true ;
    }
    else if (key == 'a') {
      aPressed = true ;
    }
    else if (key == 's') {
      sPressed = true ;
    }
    else if (key == 'd') {
      dPressed = true ;
    }
  }
}

void keyReleased() {
  if (key == 'w') {
    wPressed = false ;
  }
  else if (key == 'a') {
    aPressed = false ;
  }
  else if (key == 's') {
    sPressed = false ;
  }
  else if (key == 'd') {
    dPressed = false ;
  }
  
}

void move() {
  //w
  Player p = P1 ;
  if (activePlayer == 2) p = P2 ;
  Player other = P2 ;
  if (activePlayer == 2) other = P1 ;
  if (wPressed && ! sPressed) {
    if (aPressed && !dPressed) {
      p.move(-3.5355, 0, 5 * (float)Math.PI / 4, tiles,other);
      p.move(0, -3.5355, 5 * (float)Math.PI / 4, tiles,other);
      p.move(-3.5355, 0, 5 * (float)Math.PI / 4, tiles,other);
      p.move(0, -3.5355, 5 * (float)Math.PI / 4, tiles,other);
    } 
    else if (dPressed && !aPressed) {
      p.move(3.5355, 0, 7 * (float)Math.PI / 4, tiles,other);
      p.move(0, -3.5355, 7 * (float)Math.PI / 4, tiles,other);
      p.move(3.5355, 0, 7 * (float)Math.PI / 4, tiles,other);
      p.move(0, -3.5355, 7 * (float)Math.PI / 4, tiles,other);
    } 
    else {
      p.move(0, -5, 3 * (float)Math.PI / 2, tiles,other);
      p.move(0, -5, 3 * (float)Math.PI / 2, tiles,other);
    }
  }
  //s
  else if (sPressed && ! wPressed) {
    if (aPressed && !dPressed) {
      p.move(0, 3.5355, 3 * (float)Math.PI / 4, tiles,other);
      p.move(-3.5355, 0, 3 * (float)Math.PI / 4, tiles,other);
      p.move(0, 3.5355, 3 * (float)Math.PI / 4, tiles,other);
      p.move(-3.5355, 0, 3 * (float)Math.PI / 4, tiles,other);
    } 
    else if (dPressed && !aPressed) {
      p.move(0, 3.5355, 1 * (float)Math.PI / 4, tiles,other);
      p.move(3.5355, 0, 1 * (float)Math.PI / 4, tiles,other);
      p.move(0, 3.5355, 1 * (float)Math.PI / 4, tiles,other);
      p.move(3.5355, 0, 1 * (float)Math.PI / 4, tiles,other);
    } 
    else {
      p.move(0, 5, (float)Math.PI / 2, tiles,other);
      p.move(0, 5, (float)Math.PI / 2, tiles,other);
    }
  }
  //a
  else if (aPressed && ! dPressed) {
    p.move(-5, 0, (float)Math.PI, tiles,other);
    p.move(-5, 0, (float)Math.PI, tiles,other);
  }
  //d
  else if (dPressed && ! aPressed) {
    p.move(5, 0, 0, tiles,other);
    p.move(5, 0, 0, tiles,other);
  }
}

void inGameDisplay(int timeElapsed) { 
 if (!(orderAdded) && ((timeElapsed % 21) == 0) && (timeElapsed <= timer - 25)) {
    Order newOrder = new Order(0,0,timeElapsed,timeElapsed,timeElapsed+35,score) ;
    Ingredient cabbage = new Ingredient(0,0,color(#2BD668), "cut_cabbage",true, false) ;
    Ingredient tomato = new Ingredient(0,0,color(255,0,0), "cut_tomato",true, false) ;
    cabbage.isCut = true ;
    tomato.isCut = true ;
    newOrder.container.putOn(cabbage) ;
    if(Math.random() > .5) {
       newOrder.container.putOn(tomato) ;
    }
    orders.add(newOrder) ;
    orderAdded = true ;
  }
  if ((timeElapsed % 21) == 3) orderAdded = false ;
  float x = 0 ;
  Order removed = new Order(1,1,1,1,2,score) ;
  for(Order o : orders) {
    o.curTime = timeElapsed ; 
    o.display(20 + x*108, 10) ;
    if (o.curTime >= o.endTime) {
      removed = o ;
    }
    x++ ;
  }
  orders.remove(removed) ;
  fill(0);
  textSize(40);
  if (timer - timeElapsed <= 10) fill(color(#F54343)) ;
  if ((timer - timeElapsed)%60 > 10) {
    text((timer - timeElapsed)/60 + ":" + (timer - timeElapsed)%60,950,65) ;  
  } else {
    if ((timer - timeElapsed)%60 == 10) text((timer - timeElapsed)/60 + ":" + (timer - timeElapsed)%60,950,65) ;  
    else text((timer - timeElapsed)/60 + ":0" + (timer - timeElapsed)%60,950,65) ;  
  }
  fill(0);
  text("Score: " + score[0],700,65) ;
  for(Tile t : tiles) {
    t.display() ;
  }
  for (Item i : items) {
    i.display(); 
  }
  P1.display();
  P2.display();
  fill(255);
  textSize(20);
  text("FPS: "+frameRate,10,700) ;
  move() ; 
}

void gameOverDisplay() {
    String endText = "Better luck next time!";
    stroke(0);
    color c1 = 230;
    color c2 = 230;
    color c3 = 230;
    if (score[0] >= 50) {
      c1 = color(#FFFF00);
      endText = "An apprentice's skill!";
    }
    if (score[0] >= 100) {
      c2 = color(#FFFF00);
      endText = "Not bad for a beginner!";
    }
    if (score[0] >= 150) {
      c3 = color(#FFFF00);
      endText = "Culinary genius!";
    }
    fill(80, 100);
    rect(1080/2 - 300, 720/2 - 125 ,600, 325);
    fill(c1);
    ellipse(1080/2 - 150, 720/2 + 100, 100, 100);
    fill(c2);
    ellipse(1080/2 , 720/2 + 100, 100, 100);
    fill(c3);
    ellipse(1080/2 + 150, 720/2 + 100, 100, 100);
    fill(0);
    textSize(40);
    text(endText, 1080/3, 720/2 - 50);  
}
