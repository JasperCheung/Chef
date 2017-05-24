color tangle =color ( (int) random(255),(int) random(255),(int) random(255) );
boolean mouseOn = false;//if you pressed on the button 
PFont f;
// Variable to store text currently being typed
String typing = "";
// Variable to store saved text when return is hit
String saved = "";

void setup(){
  size(700, 700);

  f = createFont("Arial",16,true);
  textFont(f,36);
 
  
}


void draw(){
  fill( tangle );
  rect(0,0,500,500);
  tet();
  int indent = 25;  

  // Set the font and fill for text  
  textFont(f);  
  fill(0);  

  // Display everything  
  text(typing, indent, 90);  
  text(saved, indent, 90);
 
}
void takeIn(){
   if( mouseOn){
  fill(0);
  text("true" , 250, 250);}
  
}
void tet(){
  if( mouseOn){
  fill(0);
  text("true" , 250, 250);}
  else{
     fill(0);
  text("false" , 250, 250);}
  
}
void mousePressed(){
  if(mouseX < 500 && mouseY < 500){
    
    tangle = color ( (int) random(255),(int) random(255),(int) random(255) );
    mouseOn = true;
    
  }
  else{
    mouseOn = false;
  }
}
void keyPressed() {  
  // If the return key is pressed, save the String and clear it  
  if (key == '\n' ) {    
    saved = typing;    
    typing = "";  
    // Otherwise, concatenate the String  
  } else if(mouseOn) {    
    saved = "";
    typing = typing + key;   
  }
}  
  