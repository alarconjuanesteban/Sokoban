class Creador extends Level {
  protected PFont Text;
  protected int numeroElemento=0;
  protected int fila=0;
  protected int columna=0;
  protected PImage elemento;
  protected String nombre = "Piso";
  protected Table cTable;

  Creador() {
  }
  public void draw() {
    escenarioPrueba();
    texto();
    figuras();
    botones();
    selTextura(numeroElemento);
    loadData();
  }
  public void loadData() {
    datacTable = loadTable("data/NivelesC/lvlCdata.csv");
    alto = datacTable.getInt(0, 0);
    ancho = datacTable.getInt(0, 1);
    transAlto = (height-(((int)(height/alto))*alto))/2;
    transAncho = ((width/3)*4-((int(height/ancho))*ancho))/2;
    cTable = loadTable("data/NivelesC/lvlCprueba.csv");
  }
  
  public void escenarioPrueba() {
    pushMatrix();
    translate(transAncho, transAlto);
    for (int i=0; i<alto; i++) {
      for (int j=0; j<ancho; j++) {
        int valor = cTable.getInt(i, j);
        if (valor == 1) {
          pared = loadImage("/data/Images/Pared/2.png");
          pared.resize(height/ancho, height/alto);
          image(pared, j*(height/ancho), i*(height/alto));
        }
        if (valor ==0) {
          pushStyle();
            piso = loadImage("/data/Images/Piso/4.png");
            piso.resize(height/ancho, height/alto);
            image(piso, j*(height/ancho), i*(height/alto));
          popStyle();
        }
        if (valor ==2) {
          pushStyle();
            caja = loadImage("/data/Images/Caja/Brillante/1.png");
            caja.resize(height/ancho, height/alto);
            image(caja, j*(height/ancho), i*(height/alto));
          popStyle();
        }
        if (valor==3) {
          diamante = loadImage("/data/Images/Diamante/7.png");
          diamante.resize(height/ancho-1, height/alto-1);
          image(diamante, j*(height/ancho), i*(height/alto));
        }
          if (valor==4) {
            cajaD = loadImage("/data/Images/Caja/Opaca/1.png");
            cajaD.resize(height/ancho, height/alto);
            image(cajaD, j*(height/ancho), i*(height/alto));
          }
        }
      }
    popMatrix();
  }
  public void selTextura(int elementoActual) {
    if (elementoActual==0) {
      elemento=loadImage("/data/Images/Piso/4.png");
      nombre="Piso";
    }
    if (elementoActual==1) {
      elemento=loadImage("/data/Images/Pared/2.png");
      nombre="Pared";
    }
    if (elementoActual==2) {
      elemento=loadImage("/data/Images/Caja/Brillante/1.png");
      nombre="Caja";
    }
    if (elementoActual==3) {
      elemento=loadImage("/data/Images/Diamante/7.png");
      nombre="Diamante";
    }
    if (elementoActual==4) {
      elemento=loadImage("/data/Images/Caja/Opaca/1.png");
      nombre="CajaD";
    }
    if (elementoActual==5) {
      elemento=loadImage("/data/Images/Jugador/"+ J +"/J"+ J +"-right.png");
      nombre="Jugador";
    }
    if (elementoActual==6) {
       elemento=loadImage("/data/Images/Piso/1.png");
      nombre="Vacio";
    }
      if (elementoActual==7) {
      numeroElemento=0;
    }
    if (elementoActual==-1) {
      numeroElemento=6;
    }
    pushStyle();
      elemento.resize(height/6, height/6);
      image(elemento, (width/48)*6, (height/16)*7);
    popStyle();
  }
  public void figuras() {
    pushStyle();
      fill(255);
      beginShape(TRIANGLES);
        vertex((width/6)+width/12, (((height/8)*4))+(height/32));
        vertex((width/6)+width/12, (((height/8)*4))-(height/32));
        vertex((width/3)-width/32, (height/8)*4);
      endShape();
      beginShape(TRIANGLES);
        vertex((width/6)-width/12, (((height/8)*4))+(height/32));
        vertex((width/6)-width/12, (((height/8)*4))-(height/32));
        vertex(width/32, (height/8)*4);
      endShape();
    popStyle();
  }
  public void texto() {
    pushStyle();
      fill (255);
      Text= loadFont("PressStart2P-30.vlw");
      textFont(Text);
      textAlign(CENTER, CENTER);
      text("Size", (width/6), (height/8)-(height/16));
      text("Objeto", (width/6), ((height/8)*3)-(height/16));
      text("Atras", (width/6), ((height/8)*7)-(height/16));
      text("Probar", (width/6), ((height/8)*8)-(height/16));
  
      Text = loadFont("PressStart2P-20.vlw");
      textFont(Text);  
      textAlign(CENTER, CENTER);
      text(nombre, (width/6), ((height/8)*6)-(height/16));
  
      Text = loadFont("PressStart2P-10.vlw");
      textFont(Text);  
      textAlign(CENTER, CENTER);
      text("+Columna", (width/12), (height/8)+(height/32));
      text("-Columna", (width/12), (height/8)+(height/32)*3);
      text("+Fila", (width/12)*3, (height/8)+(height/32));
      text("-Fila", (width/12)*3, (height/8)+(height/32)*3);
    popStyle();
  }
  public void botones() {
    if (X >(width/6)-(width/12)  && X < (width/6)+(width/12)  && 
      Y> (((height/8)*7)-(height/16)-height/32) && Y < (((height/8)*7)-(height/16)+height/32)) {
      ventana_actual = 'v';
    }
    if (X >(width/6)+width/12  && X < (width/6)+(width/12)*2  && 
      Y> ((height/8)*3)+(height/16) && Y < ((height/8)*3)+(height/16)*3 ) {
      numeroElemento+=1 ;
    }
    if (X >width/24  && X < (width/12)  && 
      Y> ((height/8)*3)+(height/16) && Y < ((height/8)*3)+(height/16)*3 ) {
      numeroElemento=numeroElemento-1 ;
    }
    if (X >0+ width/24  && X < (width/6)-width/24  && 
      Y> (height/8) && Y < (height/8)+(height/16)) {
      TableRow row = datacTable.addRow();
      row.setInt(0, alto);
      row.setInt(1, ancho+1);
      if (datacTable.getRowCount()>1) {
        datacTable.removeRow(0);
      }
      saveTable(datacTable, "data/NivelesC/lvlCdata.csv");
    }
    if (X >0+ width/24  && X < (width/6)-width/24  && 
      Y> (height/8)*2-(height/16) && Y < (height/8)*2) {
      TableRow row = datacTable.addRow();
      row.setInt(0, alto);
      row.setInt(1, ancho-1);
      if (datacTable.getRowCount()>1) {
        datacTable.removeRow(0);
      }
      saveTable(datacTable, "data/NivelesC/lvlCdata.csv");
    }
    if (X >width/6+ width/24  && X < (width/6)*2-width/24  && 
      Y> (height/8) && Y < (height/8)+(height/16)) {
      TableRow row = datacTable.addRow();
      row.setInt(0, alto+1);
      row.setInt(1, ancho);
      if (datacTable.getRowCount()>1) {
        datacTable.removeRow(0);
      }
      saveTable(datacTable, "data/NivelesC/lvlCdata.csv");
    }
    if (X >width/6+ width/24  && X < (width/6)*2-width/24  && 
      Y> (height/8)*2-(height/16) && Y < (height/8)*2) {
      TableRow row = datacTable.addRow();
      row.setInt(0, alto-1);
      row.setInt(1, ancho);
      if (datacTable.getRowCount()>1) {
        datacTable.removeRow(0);
      }
      saveTable(datacTable, "data/NivelesC/lvlCdata.csv");
    }
    int difx = (int)(width*(1293/1366)-width*(526/1366));
    for (int l=0; l<ancho; l++) {
      for (int k=0; k<ancho; k++) {
        if (X>(width*(0.38))+((difx/ancho)*k) && X<(width*0.95)+((difx/ancho)*(k+1))) {
          columna=k;
          println(columna);
          if (Y>0+(height/alto)*l && Y<(height/alto)*(l+1)) {
            fila=l;
            cambiaElementos(fila, columna, numeroElemento);
            println(fila);
          }
        }
      }
      columna=0;
    }
    X = 0;
    Y = 0;
  }
  public void cambiaElementos(int fila, int columna, int elemento) {
    if(elemento==6)
    elemento=9;
    cTable.setInt(fila, columna, elemento);
    saveTable(cTable, "data/NivelesC/lvlCprueba.csv");
  }
}