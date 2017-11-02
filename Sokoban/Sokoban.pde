//  Archivo Principal, aquí inicia la ejecución del programa.

void setup(){
  
  size(700,700);
  // fullScreen();

}

void draw(){
  
  
  background(1000,1000,1000);
  
  Level prueba = new Level();
  prueba.nivel(3);
  prueba.grilla();
  prueba.Print();
  fill(0,0,0);
  //rect(10,10,10,10);


}