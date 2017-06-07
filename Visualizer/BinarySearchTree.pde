//split evenly the space between all nodes of a particular layer
void displayBt() {
  int layer = 0;
  //position for that layer (starting at 0)
  int i = 0;
  float y = 100;
  int size = 40;
  displayBtNode(bt.getRoot(), layer, i, y, size);
}
void displayBtNode(TreeNode tn, int layer, int i, float y, int size) {
  if (tn == null)
    return;
  float x = calculateX(layer, i);
  if (tn.getLeft() != null) {
    float newX = calculateX(layer + 1, 2 * i);
    float newY = y + size * 1.5;
    line(x, y, newX, newY); 
    displayBtNode(tn.getLeft(), layer + 1, 2 * i, newY, size);
  }
  if (tn.getRight() != null) {
    float newX = calculateX(layer + 1, 2 * i + 1);
    float newY = y + size * 1.5;
    line(x, y, newX, newY);
    displayBtNode(tn.getRight(), layer + 1, 2 * i + 1, newY, size);
  }
  fill(255);
  ellipse(x, y, size, size);
  fill(0);
  text(tn.getValue(), x, y);
}
//return the x value for corresponding layer and position for that layer
float calculateX(int layer, int i) {
  return width * (i + 1) / ( pow(2, layer) + 1);
}

  void displayBtUI() {
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "insert", 14));
  textBoxes.add(new TextBox(150, startYUI, 100, 60, "value"));
  userInput.add(new Button(250, startYUI, 50, 30, "remove", 15));
  algorithms.add(new Button(650, startYUI, 125, 30, "pre-order traversal", 3));
  algorithms.add(new Button(650, startYUI + 30, 125, 30, "in-order traversal", 4));
  algorithms.add(new Button(650, startYUI + 60, 125, 30, "post-order traversal", 5));
}