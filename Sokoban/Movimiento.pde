class Movimiento extends Level{
  
  protected PImage jugador;
  protected int xJugador = 1;
  protected int yJugador = 1;
  private int movTemp;
  
  public void xyJugador(){
    xJugador = dataTable.getInt(lvl-1, 2);
    yJugador = dataTable.getInt(lvl-1, 3)-1;
  }
  
  private void movArriba(int movTemp){
    movTemp = yJugador - 1;
    colision(0,-1);
    if (numero_elemento == 0 || numero_elemento == 3){
      yJugador = movTemp;
    }
    if (numero_elemento == 2 || numero_elemento == 4){
      colision(0,-2);
      if (numero_elemento == 0 || numero_elemento == 3){
        moverCaja(0,-1,1);
        yJugador = movTemp;
      }
    }
  }
  
  private void movAbajo(int movTemp){
    movTemp = yJugador + 1;
    colision(0,1);
    if (numero_elemento == 0 || numero_elemento == 3){
      yJugador = movTemp;
    }
    if (numero_elemento == 2 || numero_elemento == 4){
      colision(0,2);
      if (numero_elemento == 0 || numero_elemento == 3){
        moverCaja(0,1,2);
        yJugador = movTemp;
      } 
    }
  }
  
  private void movDerecha(int movTemp){
    movTemp = xJugador + 1;
    colision(1,0);
    if (numero_elemento == 0 || numero_elemento == 3){
      xJugador = movTemp;
    }
    if (numero_elemento == 2 || numero_elemento == 4){
      colision(2,0);
      if (numero_elemento == 0 || numero_elemento == 3){
        moverCaja(1,0,3);
        xJugador = movTemp;
      }
    }
  }
  
  private void movIzquierda(int movTemp){
    movTemp = xJugador - 1;
    colision(-1,0);
    if (numero_elemento == 0 || numero_elemento == 3){
      xJugador = movTemp;
    }
    if (numero_elemento == 2 || numero_elemento == 4){
      colision(-2,0);
      if (numero_elemento == 0 || numero_elemento == 3){
        moverCaja(-1,0,4);
        xJugador = movTemp;
      }
    }
  }
  
  protected void movimiento(int movCase){
    switch(movCase){
      case 1: // Arriba
        movArriba(movTemp);
        jugador = loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-up.png");
        mov = 0;
      break;
      case 2: // Abajo
        movAbajo(movTemp);
        jugador = loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-down.png");
        mov = 0;
      break;
      case 3:  // Derecha
        movDerecha(movTemp);
        jugador = loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-right.png");
        mov = 0;
      break;
      case 4: // Izquierda
        movIzquierda(movTemp);
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