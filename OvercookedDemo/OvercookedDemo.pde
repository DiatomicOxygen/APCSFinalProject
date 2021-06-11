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
int timer = 0 ;
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
int selected = 0;
boolean hardMode = false;
boolean gameOver = false;

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
  if (screen == 0) {
    background(#54649D) ;   
    textSize(50) ;
    fill(0);
    text("SELECT A LEVEL",370,200) ;
    stroke(0);
    if (selected == 0) {
      fill(#ADD8E6);   
    } else {
      fill(#54649D);
    }
    rect(1080/4 - 100, 720/3, 1080/4, 720/3);
    if (selected == 1) {
      fill(#ADD8E6);   
    } else {
      fill(#54649D);
    }
    rect(1080/2 + 100, 720/3, 1080/4, 720/3);
    if (hardMode) {
      fill(#ADD8E6);   
    } else {
      fill(#54649D);
    }
    rect(1080/2 + 100, 5 * 720/6, 400, 100);
    fill(0);
    text("1",1080/4 + 25,720/2) ;
    text("2",1080/2 + 225,720/2) ;
    text("HARDMODE",1080/2 + 125,5 * 720/6 + 65) ;

  }
  if (screen > 0) {
    background(130) ; 
    int timeElapsed = (hour() - hours) * 3600 + (minute() - minutes) * 60 + (second() - seconds) ;
    inGameDisplay(timeElapsed);
    if ((timer <= timeElapsed) && (timer+4 >= timeElapsed)) {
      activePlayer = 0 ;
      P1.active = false ;
      P2.active = false ;
      imageMode(CENTER) ;
      image(loadImage("timesup.png"),540, 360) ;
      imageMode(CORNER) ;  
    }
    if (timer+4 < timeElapsed) {
      gameOverDisplay();
      gameOver = true ;
    }
  }
} 
  

void keyPressed() {
  if ((screen == -1) && (key == ' ')) {
    screen = 0 ;
    key = 'z';
  }
  if (screen == 0 && key == ' ') {
    screen += selected + 1; 
    if (screen == 1) {
      mapOne(tiles, pTiles, containers, orders, hardMode);  
    } else {
      mapTwo(tiles, pTiles, containers, orders, hardMode);
    }
    key = 'z';
  }
  if (screen > 0) {
    if (key == '`') {
      timer = 0;
    }
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
      if (gameOver) {
        screen = 0;  
        gameOver = false;
        tiles.clear();
        items.clear();
        containers.clear();
        pTiles.clear();
        orders.clear();
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

void mousePressed() { 
  if (screen == 0) {
    if (mouseX > 1080/4 - 100 && mouseX < 1080/2 - 100 && mouseY > 720/3 && mouseY < 1440/3 ) {
      selected = 0;  
    }
    if (mouseX > 1080/2 + 100 && mouseX < 3*1080/4 + 100 && mouseY > 720/3 && mouseY < 1440/3 ) {
      selected = 1;  
    }
    if (mouseX > 1080/2 + 100 && mouseX < 1080/2 + 500 && mouseY > 5 * 720/6 && mouseY < 5 * 720/6 + 100) {
      hardMode = !hardMode;  
    }
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
 fill(#B2CED6) ;
 rect(0,0,1080,100) ;
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
    o.display(20 * (x+1) + x*108, 10) ;
    if (o.curTime >= o.endTime) {
      removed = o ;
    }
    x++ ;
  }
  orders.remove(removed) ;
  fill(0);
  textSize(40);
  if (timer - timeElapsed <= 10) fill(color(#F54343)) ;
  if (timer - timeElapsed <= 0)  text("0:00",950,65) ;  
  else {
    if ((timer - timeElapsed)%60 > 10) {
      text((timer - timeElapsed)/60 + ":" + (timer - timeElapsed)%60,950,65) ;  
    } else {
      if ((timer - timeElapsed)%60 == 10) text((timer - timeElapsed)/60 + ":" + (timer - timeElapsed)%60,950,65) ;  
      else text((timer - timeElapsed)/60 + ":0" + (timer - timeElapsed)%60,950,65) ;  
    }
  }
  textSize(50);
  fill(255);
  image(loadImage("coin.png"),770,0) ;   
  textAlign(CENTER) ;
  text(score[0],822,67) ;
  textAlign(LEFT) ;
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
  if (activePlayer != 0) move() ; 
}

void gameOverDisplay() {
    image(loadImage("tablescreen.jpg"),0,0) ;
    String endText = "Better luck next time!";
    stroke(0);
    color c1 = 230;
    color c2 = 230;
    color c3 = 230;
    if (score[0] >= 70) {
      c1 = color(#FFFF00);
      endText = "An apprentice's skill!";
    }
    if (score[0] >= 140) {
      c2 = color(#FFFF00);
      endText = "Not bad for a beginner!";
    }
    if (score[0] >= 200) {
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
