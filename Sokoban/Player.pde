class Player{
  
  PImage jugador;
  int alto;
  int ancho;
  int xJugador = 1;
  int yJugador = 1;

  Player(){}

  void draw(int lvl){
    dataTable = loadTable("data/Niveles/lvldata.csv");
    alto = dataTable.getInt(lvl-1, 0);
    ancho = dataTable.getInt(lvl-1, 1);
    movimiento(mov);
    //jugador = loadImage("/data/Images/Jugador 1/J1-down.png");
    jugador.resize(height/ancho-1, height/alto-1);
    image(jugador, xJugador*(height/ancho), yJugador*(height/alto));
  }
  
 
  void xyJugador(){
    xJugador = dataTable.getInt(lvl-1, 2);
    yJugador = dataTable.getInt(lvl-1, 3)-1;
  }
  
  void movimiento(int movTemp){
    int x;
    switch(movTemp){
      case 1: // Arriba
        x = yJugador - 1;
        colision(0,-1);
        if (numero_elemento == 0 || numero_elemento == 3){
          yJugador = x;
        }
        if (numero_elemento == 2){
          colision(0,-2);
          if (numero_elemento == 0 || numero_elemento == 3){
            moverCaja(0,-1,1);
            yJugador = x;
          }
        }
        jugador = loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-up.png");
        mov = 0;
      break;
      case 2: // Abajo
        x = yJugador + 1;
        colision(0,1);
        if (numero_elemento == 0 || numero_elemento == 3){
          yJugador = x;
        }
        if (numero_elemento == 2){
          colision(0,2);
          if (numero_elemento == 0 || numero_elemento == 3){
            moverCaja(0,1,2);
            yJugador = x;
          } 
        }
        jugador = loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-down.png");
        mov = 0;
      break;
      case 3:  // Derecha
        x = xJugador + 1;
        colision(1,0);
        if (numero_elemento == 0 || numero_elemento == 3){
          xJugador = x;
        }
        if (numero_elemento == 2){
          colision(2,0);
          if (numero_elemento == 0 || numero_elemento == 3){
            moverCaja(1,0,3);
            xJugador = x;
          }
        }
        jugador = loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-right.png");
        mov = 0;
      break;
      case 4: // Izquierda
        x = xJugador - 1;
        colision(-1,0);
        if (numero_elemento == 0 || numero_elemento == 3){
          xJugador = x;
        }
        if (numero_elemento == 2){
          colision(-2,0);
          if (numero_elemento == 0 || numero_elemento == 3){
            moverCaja(-1,0,4);
            xJugador = x;
          }
        }
        jugador = loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-left.png");
        mov = 0;
      break;
    }
  }

  public void setxJugador(int x){
    x = xJugador;
  }
   public int getxJugador(){
    return xJugador;
  }
   public void setyJugador(int y){
    y = yJugador;
  }
   public int getyJugador(){
    return yJugador;
  }

}