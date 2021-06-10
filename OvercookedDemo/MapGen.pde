void demo(ArrayList<Tile> tiles, ArrayList<ProcessingTile> pTiles, ArrayList<Container> containers, ArrayList<Order> orders) {
  hours = hour() ;
  minutes = minute() ;
  seconds = second() ;
  activePlayer = 1 ;
  P1 = new Player(400, 400, WIDTH,#95D3EA);
  P2 = new Player(800, 400, WIDTH,#ED6C6C);
  P1.active = true ;
  //wall generation
  Tile a = new Wall(70,0,100,1080,150) ;
  Tile b = new Wall(70,0,670,1080,720) ;
  Tile c = new Wall(70,0,150,117.5,670) ;
  Tile d = new Wall(70,962.5,150,1080,670) ;
  fill(200) ;
  rect(117.5,150,962.5,670) ;
  tiles.add(a) ;
  tiles.add(b) ;
  tiles.add(c) ;
  tiles.add(d) ;
  Ingredient cabbage = new Ingredient(0,0,color(#59E84F), "cabbage",true,false) ;
  Ingredient tomato = new Ingredient(0,0,color(255,0,0), "tomato",true,false) ;
  Ingredient meat = new Ingredient(0,0,color(255,0,0), "meat",true,true) ;
  //tile generation
 
  for(int i=1; i<=13; i++) {
    color tan = color(#D3BC91) ;
    float x1 = 117.5+(65*(i-1));
    float y1 = 150;
    float x2 = 117.5+(65*i);
    float y2 = 215;
    if (i != 3 && i != 5 && i != 9 && i != 11 && i != 12) tiles.add(new Tile(tan,x1,y1,x2,y2)) ;
    if ((i == 3) || (i == 5)) {
      ProcessingTile cuttingBoard = new CuttingBoard(color(#746B49),x1,y1,x2,y2);
      pTiles.add(cuttingBoard);
      tiles.add(cuttingBoard);
    }
    if (i == 9) {
      ProcessingTile crate = new Crate(cabbage,color(#746B49),x1,y1,x2,y2);
      pTiles.add(crate);
      tiles.add(crate);
    }
    if (i == 11) {
      ProcessingTile crate = new Crate(tomato,color(#746B49),x1,y1,x2,y2);
      pTiles.add(crate);
      tiles.add(crate);
    }
    if (i == 12) {
      Tile garbage = new Garbage(x1,y1,x2,y2, containers, items);
      tiles.add(garbage);
    }
    if (i != 10) {
      tiles.add(new Tile(tan,x1,605,x2,670)) ;
    }
    if (i == 10) { 
      Tile dishes = new DishDispenser(x1,605,x2,670, containers, items);
      tiles.add(dishes); 
    }
    //if (i == 4) {
    //  ProcessingTile sink = new Sink(x1,605,x2+65,670);
    //  pTiles.add(sink);
    //  tiles.add(sink);
    //}
  }
  for(int i=1; i<=6; i++) {
    color tan = color(#D3BC91) ;
    float y1 = 215+(65*(i-1));
    float y2 = 215+(65*i);
    tiles.add(new Tile(tan,117.5,y1,182.5,y2)) ;
    if (i != 3) {
      tiles.add(new Tile(tan,117.5,y1,182.5,y2));
    }
    if (i == 3) {
      ProcessingTile stove = new Stove(117.5,y1,182.5,y2);
      tiles.add(stove);
      Container pan = new Pan(0,0,140, "pan");
      containers.add(pan);
      items.add(pan);
      stove.putOn(pan);
    }
    if ((i != 6) && (i != 5)) tiles.add(new Tile(tan,507.5,y1,572.5,y2)) ;
    if (i != 6) tiles.add(new Tile(tan,507.5,y1,572.5,y2)) ;
    if (i != 4 && i != 5 && i != 2) { 
      tiles.add(new Tile(tan,897.5,y1,962.5,y2));
    }
    if (i == 4) {
      Counter counter = new Counter(897.5,y1,962.5,y2 + 65, containers, items, orders);
      tiles.add(counter);
    }
    if (i == 2) {
      ProcessingTile crate = new Crate(meat,color(#746B49),897.5,y1,962.5,y2);
      pTiles.add(crate);
      tiles.add(crate);
    }
  }
}
