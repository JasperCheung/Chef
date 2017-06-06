void  displayMinHp(){
  

  if ( _heap.size() == 0 ) 

  int h = 1; //init height to 1
  for( int i = 0; i < _heap.size(); i++ ) {
      lvlOrdTrav += i + ":" + _heap.get(i) + " ";
      if ( i >= Math.pow(2,h) - 2 ) {
    lvlOrdTrav += "\n";
    h++;
      }
  }
}
 
void displayMinHpUI() {}