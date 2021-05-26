ArrayList<Tile> tiles = new ArrayList<Tile>();
ArrayList<Item> items = new ArrayList<Item>();
float WIDTH = 1080;
float HEIGHT = 720;
Player P1 = new Player(500, 500, WIDTH);

void setup() {
  frameRate(30);
  size(1080,720) ;
  tiles = demo() ;
}

void draw() {
  background(230) ;
  fill(0);
  textSize(20);
  text("FPS: "+frameRate,5,20) ;
  for(Tile t : tiles) {
    t.display() ;
  }
  for (Item i : items) {
    i.display(); 
  }
  P1.display();
  P1.collide(tiles);

}

void keyPressed() {
  if (key == 'w') {
    P1.move(0, -10, 3 * (float)Math.PI / 2);
  }
  if (key == 'a') {
    P1.move(-10, 0, (float)Math.PI);
  }
  if (key == 's') {
    P1.move(0, 10, (float)Math.PI / 2);
  }
  if (key == 'd') {
    P1.move(10, 0, 0);
  }
  if (key == 'e') {
    P1.pickUpDrop(tiles, items);
  }
}
