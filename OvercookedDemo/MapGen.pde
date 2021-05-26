ArrayList<Tile> demo() {
  ArrayList<Tile> returnList = new ArrayList<Tile>() ;
  //wall generation
  Tile a = new Wall(70,0,100,1080,150) ;
  Tile b = new Wall(70,0,670,1080,720) ;
  Tile c = new Wall(70,0,150,117.5,670) ;
  Tile d = new Wall(70,962.5,150,1080,670) ;
  fill(200) ;
  rect(117.5,150,962.5,670) ;
  returnList.add(a) ;
  returnList.add(b) ;
  returnList.add(c) ;
  returnList.add(d) ;
  Item cabbage = new Item(0,0,color(#2BD668)) ;
  //tile generation
 
  for(int i=1; i<=13; i++) {
    color tan = color(#D3BC91) ;
    if (i != 9) returnList.add(new Tile(tan,117.5+(65*(i-1)),150,117.5+(65*i),215)) ;
    if (i == 9) returnList.add(new Crate(cabbage,color(#746B49),117.5+(65*(i-1)),150,117.5+(65*i),215)) ;
    returnList.add(new Tile(tan,117.5+(65*(i-1)),605,117.5+(65*i),670)) ;
  }
  for(int i=1; i<=6; i++) {
    color tan = color(#D3BC91) ;
    returnList.add(new Tile(tan,117.5,215+(65*(i-1)),182.5,215+(65*i))) ;
    if ((i != 6) && (i != 5)) returnList.add(new Tile(tan,507.5,215+(65*(i-1)),572.5,215+(65*i))) ;
    if (i != 6) returnList.add(new Tile(tan,507.5,215+(65*(i-1)),572.5,215+(65*i))) ;
    returnList.add(new Tile(tan,897.5,215+(65*(i-1)),962.5,215+(65*i))) ;
  }
  return returnList ;
  
}
