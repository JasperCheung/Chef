final String[] NUM = {"0", "1", "2","3","4","5","6","7","8","9"};
color tangle =color ( (int) random(255),(int) random(255),(int) random(255) );
boolean mouseOn = false;//if you pressed on the button 
PFont f;
int x, y, len, width; 
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
 printBool();
  int indent = 25;  

  // Set the font and fill for text  
  textFont(f);  
  fill(0);  

  // Display everything  
  text(typing, indent, 90);  
  text(saved, indent, 90);
 
}

void printBool(){
  if( mouseOn){
  fill(0);
  text("Mouse On: true" , 250, 250);}
  else{
     fill(0);
  text("Mouse On: false" , 250, 250);}
  
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

boolean isInt (String s){
  for(int i  = 0; i < s.length(); i++){
    for(String num: NUM){
     if(!s.substring(i, i++).equals(num)) return false;
    }
  }
 return true;
  
}