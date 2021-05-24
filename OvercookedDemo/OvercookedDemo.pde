ArrayList<Tile> tiles = new ArrayList<Tile>();
Item b = new Item(50,100,100) ;
Player P1 = new Player(500, 500);
  
void setup() {
  frameRate(30);
  size(1080,720) ;
  Tile a = new Tile(200,300,300,450,450) ;
  tiles.add(a);
  a.putOn(b) ;

}

void draw() {
  background(200) ;
  fill(0);
  textSize(20);
  text("FPS: "+frameRate,20,20) ;
  for (Tile t : tiles) {
    t.display(); 
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

}
