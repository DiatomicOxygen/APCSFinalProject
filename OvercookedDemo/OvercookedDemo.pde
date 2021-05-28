ArrayList<Tile> tiles = new ArrayList<Tile>();
ArrayList<Item> items = new ArrayList<Item>();
ArrayList<Container> containers = new ArrayList<Container>();
ArrayList<ProcessingTile> pTiles = new ArrayList<ProcessingTile>();
float WIDTH = 1080;
float HEIGHT = 720;
int minutes = 0 ;
int seconds = 0 ;
int timer = 300 ;
Player P1 = new Player(400, 400, WIDTH);

void setup() {
  frameRate(30);
  size(1080,720) ;
  demo(tiles, pTiles,containers) ;
  minutes = minute() ;
  seconds = second() ;
  
}

void timeTick() {

}

void draw() {
  background(230) ;
  fill(0);
  textSize(20);
  text("FPS: "+frameRate,5,20) ;
  int timeElapsed = (minute() - minutes) * 60 + (second() - seconds) ;
  if (timer - timeElapsed < 0) timeElapsed = timer ;
  textSize(40);
  if (timer - timeElapsed <= 10) fill(color(#F54343)) ;
  text(timer - timeElapsed,950,65) ;
  for(Tile t : tiles) {
    t.display() ;
  }
  for (Item i : items) {
    i.display(); 
  }
  P1.display();
}

void keyPressed() {
  if (key == 'w') {
    P1.move(0, -5, 3 * (float)Math.PI / 2, tiles);
    P1.collide(tiles);
    P1.move(0, -5, 3 * (float)Math.PI / 2, tiles);
    P1.collide(tiles);
  }
  if (key == 'a') {
    P1.move(-5, 0, (float)Math.PI, tiles);
    P1.collide(tiles);
    P1.move(-5, 0, (float)Math.PI, tiles);
    P1.collide(tiles);
  }
  if (key == 's') {
    P1.move(0, 5, (float)Math.PI / 2, tiles);
    P1.collide(tiles);
    P1.move(0, 5, (float)Math.PI / 2, tiles);
    P1.collide(tiles);
  }
  if (key == 'd') {
    P1.move(5, 0, 0, tiles);
    P1.collide(tiles);
    P1.move(5, 0, 0, tiles);
    P1.collide(tiles);
  }
  if (key == 'e') {
    P1.pickUpDrop(tiles, items, containers);
  }
  if (key == 'q') {
    P1.interact(pTiles, items); 
  }
}
