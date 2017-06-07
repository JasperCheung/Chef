void displayMinHp() {
  //split evenly the space between all nodes of a particular layer

  int layer = 0;
  //position for that layer (starting at 0)
  int i = 0;
  int index = 0;
  
  float y = 100;
  int size = 40;
  displayMinHp(index, layer, i, y, size);
}

void displayMinHp(int index, int layer, int i, float y, int size) {
  if (index  > minHp._heap.size()  -1)
    return;
  float x = calculateX(layer, i);
  int left = index * 2 + 1;
  int right = index * 2 + 2;
  if (left < minHp._heap.size()  ) {
    float newX = calculateX(layer + 1, 2 * i);
    float newY = y + size * 1.5;
    line(x, y, newX, newY); 
    displayMinHp(left, layer + 1, 2 * i, newY, size);
  }
  if (right < minHp._heap.size()  ) {
    float newX = calculateX(layer + 1, 2 * i + 1);
    float newY = y + size * 1.5;
    line(x, y, newX, newY);
    displayMinHp(right, layer + 1, 2 * i + 1, newY, size);
  }
  fill(255);
  ellipse(x, y, size, size);
  fill(0);
  text(minHp._heap.get(index), x, y);
}

void displayMinHpUI() {
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 60, 30, "add", 22));
  userInput.add(new Button(160, startYUI, 120, 30, "Remove Min", 23));
}