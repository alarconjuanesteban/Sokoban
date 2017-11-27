class Level{
 
   protected int alto;
   protected int ancho;
   protected int transAlto;
   protected int transAncho;
   protected PImage caja;
   protected PImage diamante;
   protected PImage pared;
   protected PImage piso;
   protected Table table;
   protected Table datatTable;

   public void level(){
     caja = loadImage("/data/Images/Caja/Brillante/1.png");
     diamante = loadImage("/data/Images/Diamante/1.png"); //<>//
     piso = loadImage("/data/Images/Piso/1.png");
     pared = loadImage("/data/Images/Pared/1.png");
   }
   
   public void level(int lvl){
      dataTable = loadTable("data/Niveles/lvldata.csv");
      alto = dataTable.getInt(lvl-1, 0);
      ancho = dataTable.getInt(lvl-1, 1);
      transAlto = (height-(((int)(height/alto))*alto))/2;
      transAncho = (height-(((int)(height/ancho))*ancho))/2;
      table = loadTable("data/Niveles/lvl"+ lvl +".csv");
    }
   
   public void escenario(int tPared, int tPiso){
     pushMatrix();
     translate(transAncho,transAlto);
       for(int i=0 ; i<alto ; i++){
         for(int j=0 ; j<ancho; j++){
           int valor = table.getInt(i,j);
           if (valor == 1){
             pushStyle();
               pared = loadImage("/data/Images/Pared/"+ tPared +".png");
               pared.resize(height/ancho, height/alto);
               image(pared, j*(height/ancho), i*(height/alto));
             popStyle();
           }
           if (valor != 1 && valor != 9){
             pushStyle();
               piso = loadImage("/data/Images/Piso/"+ tPiso +".png");
               piso.resize(height/ancho, height/alto);
               image(piso, j*(height/ancho), i*(height/alto));
             popStyle();
           }
         }
       }
     popMatrix();
   }
   
   public void elementos(int tCaja, int tDiamante){
     pushMatrix();
     translate(transAncho,transAlto);
     for(int i=0 ; i<alto ; i++){
       for(int j=0 ; j<ancho; j++){
         pushStyle();
           int valor = table.getInt(i,j);
           switch(valor){
             case 2: // Caja Brillante
               caja = loadImage("/data/Images/Caja/Brillante/"+ tCaja +".png");
               caja.resize(height/ancho, height/alto);
               image(caja, j*(height/ancho), i*(height/alto));
             break;
             case 3: // Diamantes
               diamante = loadImage("/data/Images/Diamante/"+ tDiamante +".png");
               diamante.resize(height/ancho-1, height/alto-1);
               image(diamante, j*(height/ancho), i*(height/alto));
             break;
             case 4: // Caja Opaca
               caja = loadImage("/data/Images/Caja/Opaca/"+ tCaja +".png");
               caja.resize(height/ancho, height/alto);
               image(caja, j*(height/ancho), i*(height/alto));
             break;
           }
         popStyle();
       }
     }
     popMatrix();
   }
   
    private int contador(){
      int temp = 0;
      for(int i=0 ; i<alto ; i++){
        for(int j=0 ; j<ancho; j++){
          int valor = table.getInt(i,j);
          if (valor == 2)
            temp += 1;
        }
      }
      return temp;
    }
  
  public void completo(){
    if (contador() == 0)
      ventana_actual = 'l';
  }
  
  public void reset(){
    dataTable = loadTable("data/Niveles/lvldata.csv");
    table = loadTable("data/Niveles/lvl"+ lvl +".csv");
  }
  
  public int conocer_elemento(int i,int j){
    int elemento = table.getInt(i,j);
    return elemento;
  }
  
  public void movCajaArriba(int direccionX, int direccionY){
    colision(0,-2);
    if (numero_elemento == 3)
      table.setInt(direccionY-1, direccionX, 4);
    else
      table.setInt(direccionY-1, direccionX, 2);
    colision(0,-1);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  } 
  
  public void movCajaAbajo(int direccionX, int direccionY){
    colision(0,2);
    if (numero_elemento == 3)
      table.setInt(direccionY+1, direccionX, 4);
    else
      table.setInt(direccionY+1, direccionX, 2);
    colision(0,1);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  }
  
  public void movCajaDerecha(int direccionX, int direccionY){
    colision(2,0);
    if (numero_elemento == 3)
      table.setInt(direccionY, direccionX+1, 4);
    else
      table.setInt(direccionY, direccionX+1, 2);
    colision(1,0);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  }
  
  public void movCajaIzquierda(int direccionX, int direccionY){
    colision(-2,0);
    if (numero_elemento == 3)
      table.setInt(direccionY, direccionX-1, 4);
    else
      table.setInt(direccionY, direccionX-1, 2);
    colision(-1,0);
    if (numero_elemento == 4)
      table.setInt(direccionY, direccionX, 3);
    else
      table.setInt(direccionY, direccionX, 0);
  }
  
}