class Player{
int i;
int j;
PImage jugador1;
char posicion;
  //  Todo lo relacionado con el jugador:
  //    - Dibujo

   Player(){

   }

  void draw(/*int i, int j,*/int alto, int ancho){
  
    jugador1 = loadImage("jugador1.png");
    jugador1.resize(height/ancho-1, height/alto-1);
    image(jugador1, j*(height/ancho), i*(height/alto));
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