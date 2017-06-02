void displayBt() {
  float x = width / 2;
  float y = 100;
  int size = 40;
  displayBtNode(bt.getRoot(), x, y, size);
}
void displayBtNode(TreeNode tn, float x, float y, int size) {
  if (tn == null)
    return;
  fill(255);
  ellipse(x, y, size, size);
  fill(0);
  text(tn.getValue(), x, y);
  float adjust = (size / 2) / sqrt(2); //go the border of circle
  if (tn.getLeft() != null) {
    float newX = x - size * 1.5;
    float newY = y + size * 1.5;
    line(x - adjust, y + adjust, newX + adjust, newY - adjust); 
    displayBtNode(tn.getLeft(), newX, newY, size);
  }
  if (tn.getRight() != null) {
    float newX = x + size * 1.5;
    float newY = y + size * 1.5;
    line(x + adjust, y + adjust, newX - adjust, newY - adjust);
    displayBtNode(tn.getRight(), newX, newY, size);
  }
}

  void displayBtUI() {
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "insert", 14));
 
  textBoxes.add(new TextBox(150, startYUI, 100, 60, "value"));
  userInput.add(new Button(250, startYUI, 50, 30, "remove", 15));
}