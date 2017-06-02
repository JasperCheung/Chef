//draw boxes from the bottom to the top
void displaySt() {
  float x = width / 2;
  float y = height - 100;
  int size = 40;
  for (int i : st) {
    //draw box
    fill(255);
    rect(x, y, size, size);
    //draw text
    fill(0);
    text(i, x + size / 2, y + size / 2);
    y -= size;
  }
}

void displayStUI() {
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "push", 12));

  userInput.add(new Button(400, startYUI, 100, 100, "pop!!!", 13));
}