color tangle =color ( (int) random(255),(int) random(255),(int) random(255) );
boolean mouseTangle = false;
void setup(){
  size(700, 700);
  
}

void draw(){
  fill( tangle );
  rect(0,0,500,500);
  tet();
}
void takeIn(){
   if( mouseTangle){
  fill(0);
  text("true" , 250, 250);}
  
}
void tet(){
  if( mouseTangle){
  fill(0);
  text("true" , 250, 250);}
  else{
     fill(0);
  text("false" , 250, 250);}
  
}
void mousePressed(){
  if(mouseX < 500 && mouseY < 500){
    
    tangle = color ( (int) random(255),(int) random(255),(int) random(255) );
    mouseTangle = true;
    
  }
  else{
    mouseTangle = false;
  }
  
  
}