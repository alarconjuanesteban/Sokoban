class Player{
  
  PImage jugador;
  int alto;
  int ancho;
  int xJugador = 1;
  int yJugador = 1;

  Player(){}

  void draw(int lvl){
    dataTable = loadTable("data/lvldata.csv");
    alto = dataTable.getInt(lvl-1, 0);
    ancho = dataTable.getInt(lvl-1, 1);
    movimiento(mov);
    //jugador = loadImage("/data/Images/Jugador 1/J1-down.png");
    jugador.resize(height/ancho-1, height/alto-1);
    image(jugador, xJugador*(height/ancho), yJugador*(height/alto));
  }
  
  void xyJugador(){
    xJugador = dataTable.getInt(lvl-1, 2);
    yJugador = dataTable.getInt(lvl-1, 3);
  }
  
  void movimiento(int movTemp){
    int x;
    switch(movTemp){
      case 1: // Arriba
        x = yJugador - 1;
        yJugador = x;
        jugador = loadImage("/data/Images/Jugador 1/J1-up.png");
        mov = 0;
      break;
      case 2: // Abajo
        x = yJugador + 1;
        yJugador = x;
        jugador = loadImage("/data/Images/Jugador 1/J1-down.png");
        mov = 0;
      break;
      case 3:  // Derecha
        x = xJugador + 1;
        xJugador = x;
        jugador = loadImage("/data/Images/Jugador 1/J1-right.png");
        mov = 0;
      break;
      case 4: // Izquierda
        x = xJugador - 1;
        xJugador = x;
        jugador = loadImage("/data/Images/Jugador 1/J1-left.png");
        mov = 0;
      break;
    }
  }
  
  void movArriba(){
    int y;
    y = yJugador - 1;
    yJugador = y;
    jugador = loadImage("/data/Images/Jugador 1/J1-up.png");
  }
  
  void keyPressed(){
    if ((key == CODED && keyCode == UP) || (key == 'w') || (key == 'W'))
      jugador = loadImage("/data/Images/Jugador 1/J1-up.png");
    if ((key == CODED && keyCode == DOWN) || (key == 's') || (key == 'S'))
      jugador = loadImage("/data/Images/Jugador 1/J1-down.png");
    if ((key == CODED && keyCode == RIGHT) || (key == 'd') || (key == 'D'))
      jugador = loadImage("/data/Images/Jugador 1/J1-right.png");
    if ((key == CODED && keyCode == LEFT) || (key == 'a') || (key == 'A'))
      jugador = loadImage("/data/Images/Jugador 1/J1-left.png");
  }

}