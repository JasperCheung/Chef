void displayDque(){
 
 int x = 40;
  int y = 200;
  int size = 40;
  for (int i : dQue) {
    if ( x + size > width) {
      y+=60;
      x = 40;
    }
    fill(255);
    rect(x, y, size, size); //draw square
    fill(0);
    text(i, x + size / 2, y + size / 2);
    x += size;
  }
}


void displayDqueUI(){
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "push", 18));

  userInput.add(new Button(160, startYUI, 100, 30, "Remove First", 19)); 
  textBoxes.add(new TextBox(270, startYUI, 100, 60, "value"));
  userInput.add(new Button(380, startYUI, 60, 30, "Enqueue", 20));

  userInput.add(new Button(450 , startYUI, 100, 30, "Remove Last", 21));
}