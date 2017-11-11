class Player{
  
  PImage jugador;
  Table dataTable;

  Player(){}

  void draw(int lvl){
    dataTable = loadTable("data/lvldata.csv");
    int alto = dataTable.getInt(lvl-1, 0);
    int ancho = dataTable.getInt(lvl-1, 1);
    int xJugador = dataTable.getInt(lvl-1, 2);
    int yJugador = dataTable.getInt(lvl-1, 3);
    jugador = loadImage("/data/Images/Jugador 1/J1-down.png");
    jugador.resize(height/ancho-1, height/alto-1);
    image(jugador, xJugador*(height/ancho), yJugador*(height/alto));
  }
  
}