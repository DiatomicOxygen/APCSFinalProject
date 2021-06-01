ArrayList<Tile> tiles = new ArrayList<Tile>();
ArrayList<Item> items = new ArrayList<Item>();
ArrayList<Container> containers = new ArrayList<Container>();
ArrayList<ProcessingTile> pTiles = new ArrayList<ProcessingTile>();
ArrayList<Order> orders = new ArrayList<Order>();
CuttingBoard P1CuttingBoard = new CuttingBoard(0,0,0,0,0) ;
float WIDTH = 1080;
float HEIGHT = 720;
int hours = 0 ;
int minutes = 0 ;
int seconds = 0 ;
int timer = 300 ;
int[] score = new int[1]; 
Player P1 = new Player(400, 400, WIDTH);
boolean orderAdded = false ;
boolean wPressed = false; 
boolean aPressed = false; 
boolean sPressed = false; 
boolean dPressed = false; 
int actionStart = (hour()) * 3600 + (minute()) * 60 + (second()) ;


void setup() {
  frameRate(30);
  size(1080,720) ;
  demo(tiles, pTiles,containers, orders) ;
  hours = hour() ;
  minutes = minute() ;
  seconds = second() ;
}

void draw() {
  background(230) ; 
  int timeElapsed = (hour() - hours) * 3600 + (minute() - minutes) * 60 + (second() - seconds) ;
  if (timer - timeElapsed < 0) timeElapsed = timer ;
  if (!(orderAdded) && ((timeElapsed % 25) == 0) && (timeElapsed <= timer - 25)) {
    Order newOrder = new Order(0,0,timeElapsed,timeElapsed,timeElapsed+35,score) ;
    Ingredient newIngredient = new Ingredient(0,0,color(#2BD668), "cut_cabbage",true, false) ;
    newIngredient.isCut = true ;
    newOrder.container.putOn(newIngredient) ;
    orders.add(newOrder) ;
    orderAdded = true ;
  }
  if ((timeElapsed % 25) == 3) orderAdded = false ;
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
    text((timer - timeElapsed)/60 + ":0" + (timer - timeElapsed)%60,950,65) ;  
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
  fill(255);
  textSize(20);
  text("FPS: "+frameRate,10,700) ;
  move() ;
  if (P1.busy) {
    int curTime = (hour()) * 3600 + (minute()) * 60 + (second()) ;
    fill(255) ;
    rect(P1.x+25,P1.y-25,50,-10) ;
    colorMode(HSB,359,100,100) ;
    color c = color((curTime-actionStart)*20-10,90,90) ;
    fill(c) ;
    rect(P1.x+27,P1.y-27,46*((curTime-actionStart)/5.0),-6) ;
    colorMode(RGB,255,255,255) ;
    if (curTime >= actionStart+5) {
      println(curTime) ;
      P1CuttingBoard.completeCutting(P1) ;
    }
  }
}

void keyPressed() {
  if (key == 'q') {
    P1.interact(pTiles, items); 
  }
  if (key == 'e') {
    P1.pickUpDrop(tiles, items, containers);
  }
  if (key == ' ') {
    if (P1.dashing < -50) {
      P1.dashing = 10;  
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
  if (wPressed && ! sPressed) {
    if (aPressed && !dPressed) {
      P1.move(-3.5355, 0, 5 * (float)Math.PI / 4, tiles);
      P1.move(0, -3.5355, 5 * (float)Math.PI / 4, tiles);
      P1.move(-3.5355, 0, 5 * (float)Math.PI / 4, tiles);
      P1.move(0, -3.5355, 5 * (float)Math.PI / 4, tiles);
    } 
    else if (dPressed && !aPressed) {
      P1.move(3.5355, 0, 7 * (float)Math.PI / 4, tiles);
      P1.move(0, -3.5355, 7 * (float)Math.PI / 4, tiles);
      P1.move(3.5355, 0, 7 * (float)Math.PI / 4, tiles);
      P1.move(0, -3.5355, 7 * (float)Math.PI / 4, tiles);
    } 
    else {
      P1.move(0, -5, 3 * (float)Math.PI / 2, tiles);
      P1.move(0, -5, 3 * (float)Math.PI / 2, tiles);
    }
  }
  //s
  else if (sPressed && ! wPressed) {
    if (aPressed && !dPressed) {
      P1.move(0, 3.5355, 3 * (float)Math.PI / 4, tiles);
      P1.move(-3.5355, 0, 3 * (float)Math.PI / 4, tiles);
      P1.move(0, 3.5355, 3 * (float)Math.PI / 4, tiles);
      P1.move(-3.5355, 0, 3 * (float)Math.PI / 4, tiles);
    } 
    else if (dPressed && !aPressed) {
      P1.move(0, 3.5355, 1 * (float)Math.PI / 4, tiles);
      P1.move(3.5355, 0, 1 * (float)Math.PI / 4, tiles);
      P1.move(0, 3.5355, 1 * (float)Math.PI / 4, tiles);
      P1.move(3.5355, 0, 1 * (float)Math.PI / 4, tiles);
    } 
    else {
      P1.move(0, 5, (float)Math.PI / 2, tiles);
      P1.move(0, 5, (float)Math.PI / 2, tiles);
    }
  }
  //a
  else if (aPressed && ! dPressed) {
    P1.move(-5, 0, (float)Math.PI, tiles);
    P1.move(-5, 0, (float)Math.PI, tiles);
  }
  //d
  else if (dPressed && ! aPressed) {
    P1.move(5, 0, 0, tiles);
    P1.move(5, 0, 0, tiles);
  }
}
