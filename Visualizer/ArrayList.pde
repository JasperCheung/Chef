void displayAl() {
  int x = 40;
  int y = 250;
  int size = 40;
  for (int i : al) {
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

void displayAlUI() {
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "add", 0));

  textBoxes.add(new TextBox(150, startYUI, 100, 60, "index"));
  textBoxes.add(new TextBox(250, startYUI, 100, 60, "value"));
  userInput.add(new Button(350, startYUI, 100, 30, "add-at-index", 1));

  textBoxes.add(new TextBox(450, startYUI, 100, 60, "index"));
  userInput.add(new Button(550, startYUI, 50, 30, "remove", 2));

  textBoxes.add(new TextBox(600, startYUI, 100, 60, "index"));
  textBoxes.add(new TextBox(700, startYUI, 100, 60, "value"));
  userInput.add(new Button(800, startYUI, 50, 30, "set", 3));
  
  algorithms.add(new Button(0, startYAlgo, 100, 40, "Bubble sort", 0));
  algorithms.add(new Button(100, startYAlgo, 100, 40, "Selection sort", 1));
}