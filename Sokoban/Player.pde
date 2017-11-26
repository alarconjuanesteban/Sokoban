class Player extends Movimiento{
  
  Player(){}

  public void draw(int lvl){
    dataTable = loadTable("data/Niveles/lvldata.csv");
    alto = dataTable.getInt(lvl-1, 0);
    ancho = dataTable.getInt(lvl-1, 1);
    movimiento(mov);
    jugador.resize(height/ancho-1, height/alto-1);
    image(jugador, xJugador*(height/ancho), yJugador*(height/alto));
  }
  
  public void reset(){
    xyJugador();
    movimiento(2);
    jugador.resize(height/ancho-1, height/alto-1);
    image(jugador, xJugador*(height/ancho), yJugador*(height/alto));
  }

}