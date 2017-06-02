void displayQue(){
 float x = width / 2;
  float y = height - 100;
  int size = 40;
  for (int i : que) {
    //draw box
    fill(255);
    rect(x, y, size, size);
    //draw text
    fill(0);
    text(i, x + size / 2, y + size / 2);
    y -= size;
  }
}
void displayQueUI(){ 
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "add", 16));
  userInput.add(new Button(400, startYUI, 100, 100, "remove", 17));
}