void displayQue(){
 int x = 40;
  int y = 200;
  int size = 40;
  for (int i : que) {
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
void displayQueUI(){ 
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 60, 30, "Enqueue", 16));
  userInput.add(new Button(400, startYUI, 120, 100, "Dequeue", 17));
}