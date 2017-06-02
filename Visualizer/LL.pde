//todo: use iterator
void displaySll() {
  int x = 40;
  int y = 200;
  int size = 40;
  for (int i = 0; i < sll.size(); i++) {
    //draw node
    //draw square holding value
    fill(255);
    rect(x, y, size, size); 
    fill(0);
    text(sll.get(i), x + size / 2, y + size / 2);
    x += size;
    //draw square with link
    fill(255);
    rect(x, y, size, size);
    //draw cross if no next node
    if (i == sll.size() - 1){
      drawCross(x, y, x + size, y + size);
    }
    //else draw arrow to next node
    else{
      if( x + size * 2 > width){
        drawArrow(x + size / 2, y + size / 2, 40 + size, y + 130);
        x = 40;
        y = y + 140;
      }
      else{
        drawArrow(x + size / 2, y + size / 2, x + size * 2, y + size / 2);
        x += size * 2;
      }
    }
  }
}
void displaySllUI() {
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "add", 4));

  textBoxes.add(new TextBox(150, startYUI, 100, 60, "index"));
  textBoxes.add(new TextBox(250, startYUI, 100, 60, "value"));
  userInput.add(new Button(350, startYUI, 100, 30, "add-at-index", 5));

  textBoxes.add(new TextBox(450, startYUI, 100, 60, "index"));
  userInput.add(new Button(550, startYUI, 50, 30, "remove", 6));

  textBoxes.add(new TextBox(600, startYUI, 100, 60, "index"));
  textBoxes.add(new TextBox(700, startYUI, 100, 60, "value"));
  userInput.add(new Button(800, startYUI, 50, 30, "set", 7));
}

void displayDll() {
  int x = 40;
  int y = 200;
  int size = 40;
  for (int i = 0; i < dll.size(); i++) {
    //draw node
    fill(255);
    rect(x, y, size, size);
    fill(0);
    x+=size;
    //draw square holding value
    fill(255);
    rect(x, y, size, size); 
    fill(0);
    text(dll.get(i), x + size / 2, y + size / 2);
    x += size;
    //draw square with link
    fill(255);
    rect(x, y, size, size);
    //draw cross if no next node
    if (i == dll.size() - 1){
      drawCross(x, y, x + size, y + size);
    }
    //else draw arrow to next node
    else {
      if( x + size * 3 < width){
        int heightDif = 6;
        drawArrow(x + size / 2, y + size / 2 - heightDif, x + size * 2, y + size / 2 - heightDif);
        drawArrow(x + size * 2, y + size / 2 + heightDif, x + size / 2, y + size / 2 + heightDif);
        x += size * 2;
      }
      else{
        drawArrow(x + size / 2 , y + size / 2, 40 + size - 20, y + 130);
        drawArrow(40 + size, y+ 138, x + size, y + size/2);
        x = 40;
        y = y + 140;
      }
    }
  }
}

void displayDllUI() {
  textBoxes.add(new TextBox(0, startYUI, 100, 60, "value"));
  userInput.add(new Button(100, startYUI, 50, 30, "add", 8));

  textBoxes.add(new TextBox(150, startYUI, 100, 60, "index"));
  textBoxes.add(new TextBox(250, startYUI, 100, 60, "value"));
  userInput.add(new Button(350, startYUI, 100, 30, "add-at-index", 9));

  textBoxes.add(new TextBox(450, startYUI, 100, 60, "index"));
  userInput.add(new Button(550, startYUI, 50, 30, "remove", 10));

  textBoxes.add(new TextBox(600, startYUI, 100, 60, "index"));
  textBoxes.add(new TextBox(700, startYUI, 100, 60, "value"));
  userInput.add(new Button(800, startYUI, 50, 30, "set", 11));
}

//draw cross with top-left (x1, y1) and bottom-right (x2, y2)
void drawCross(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  line(x1, y2, x2, y1);
}

//draw arrow from (x1, y1) to (x2, y2), with arrowhead at (x2, y2)
void drawArrow(int x1, int y1, int x2, int y2){
  int elevation = 8;
  //draw line
  line(x1, y1, x2, y2);
  //arrowhead, changing angle by 45 degrees
  PVector v = new PVector(x2 - x1, y2 - y1);
  v.setMag(8 * sqrt(2));
  v.rotate(PI * 5 / 4);
  line(x2, y2, x2 + v.x, y2 + v.y);
  v.rotate(PI * 3 / 2);
  line(x2, y2, x2 + v.x, y2 + v.y);
}