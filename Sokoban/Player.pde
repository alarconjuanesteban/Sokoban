class Player{
  
  int i;
  int j;
  PImage jugador;
  Table dataTable;

  Player(){}

  void draw(int lvl){
    dataTable = loadTable("data/lvldata.csv");
    int alto = dataTable.getInt(lvl-1, 0);
    int ancho = dataTable.getInt(lvl-1, 1);
    int xJugador = dataTable.getInt(lvl-1, 2);
    int yJugador = dataTable.getInt(lvl-1, 3);
    jugador = loadImage("/data/Images/jugador1.png");
    jugador.resize(height/ancho-1, height/alto-1);
    
    image(jugador, xJugador*(height/ancho), yJugador*(height/alto));
    
    /*if(char == z"){
    
    }*/
  }
  
  public void seti(int i) {
    this.i = i;
  }
   public int geti() {
    return i;
  }
   public void setj(int j) {
    this.j = j;
  }
   public int getj() {
    return j;
  }

  
}