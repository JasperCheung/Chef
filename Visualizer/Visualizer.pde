import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Stack;

ArrayList<Button> structures;
ArrayList<TextBox> textBoxes;
//textBox to edit when keys are pressed
TextBox focus;
ArrayList<Button> userInput;

//state for which data structure to display
int dataStructure;

ArrayList<Integer> al;
//singly-linked and double-linked lists
LinkedList<Integer> sll;
LinkedList<Integer> dll;

Stack<Integer> st;
BST bt;

void setup() {
  size(700, 700);
  textAlign(CENTER, CENTER);

  //structures
  structures = new ArrayList<Button>();
  structures.add(new Button(0, 0, 80, 40, "ArrayList", 0));
  structures.add(new Button(80, 0, 130, 40, "Singly-Linked List", 1));
  structures.add(new Button(210, 0, 140, 40, "Doubly-Linked List", 2));
  structures.add(new Button(350, 0, 60, 40, "Stack", 3));
  structures.add(new Button(410, 0, 100, 40, "Binary Tree", 4));

  textBoxes = new ArrayList<TextBox>();
  userInput = new ArrayList<Button>();
  
  //show arraylist as default
  dataStructure = -1;
  changeStructure(0);
  
  al = new ArrayList<Integer>();
  al.add(3);
  al.add(6);
  al.add(10);
  sll = new LinkedList<Integer>();
  sll.add(2);
  sll.add(5);
  sll.add(13);
  dll = new LinkedList<Integer>();
  dll.add(7);
  dll.add(1);
  dll.add(11);
  st = new Stack<Integer>();
  st.push(1);
  st.push(4);
  st.push(15);
  bt = new BST();
  bt.insert(0);
  bt.insert(3);
  bt.insert(17);
  bt.insert(-3);
}

void draw() {
  background(100);
  for (Button b : structures)
    b.display();
  for (TextBox t : textBoxes)
    t.display();
  for (Button b : userInput)
    b.display();
  switch(dataStructure) {
    case 0:
      displayAl();
      break;
    case 1:
      displaySll();
      break;
    case 2:
      displayDll();
      break;
    case 3:
      displaySt();
      break;
    case 4:
      displayBt();
      break;
    default:
      System.out.println("Unknown dataStructure (ID)");
  }
}

void mousePressed() {
  //go through buttons to see if button pressed
  for (Button b : structures) {
    //if pressed, do the action with the actionId
    if (b.contains(mouseX, mouseY))
      changeStructure(b.getActionID());
  }//BUTTON TEXT BOX
  for (Button b : userInput) {
    if (b.contains(mouseX, mouseY))
      buttonAction(b.getActionID());
  }
  //go through textboxes to change focus
  for (TextBox t : textBoxes) {
    if (t.contains(mouseX, mouseY))
      focus = t;
  }
}

void keyPressed() {
  if (focus == null)
    return;
  String numbers = "0123456789";
  if (numbers.indexOf(key) != -1)
    focus.text += key;
  if (key == DELETE || key == BACKSPACE) {
    String text = focus.text;
    if (!text.equals(""))
      focus.text = text.substring(0, text.length() - 1);
  }
}

void changeStructure(int actionID) {
  if (actionID == dataStructure)
    return;
  dataStructure = actionID;
  //clear current UI
  textBoxes.clear();
  focus = null;
  userInput.clear();
  //show new UI
  switch(dataStructure) {
    case 0:
      displayAlUI();
      break;
  }
}

void buttonAction(int actionID) {
  switch(actionID) {
    //arrayList
    case 0: {
      String text = textBoxes.get(0).text;
      if (text.equals(""))
        break;
      int num = Integer.parseInt(text);
      al.add(num);
      break;
    }
    case 1: {
      String text = textBoxes.get(1).text;
      if (text.equals(""))
        break;
      int ind = Integer.parseInt(text);
      text = textBoxes.get(2).text;
      if (text.equals(""))
        break;
      int val = Integer.parseInt(text);
      al.add(ind, val);
      break;
    }
    case 2: {
      String text = textBoxes.get(3).text;
      if (text.equals(""))
        break;
      int ind = Integer.parseInt(text);
      al.remove(ind);
      break;
    }
    default:
      System.out.println("Unknown actionID");
  }
}

void displayAl() {
  int x = 40;
  int y = 100;
  int size = 40;
  for (int i : al) {
    if( x + size > width){
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
  textBoxes.add(new TextBox(0, 40, 100, 60, "value"));
  userInput.add(new Button(100, 40, 50, 30, "add", 0));
  
  textBoxes.add(new TextBox(150, 40, 100, 60, "index"));
  textBoxes.add(new TextBox(250, 40, 100, 60, "value"));
  userInput.add(new Button(350, 40, 100, 30, "add-at-index", 1));
  
  textBoxes.add(new TextBox(450, 40, 100, 60, "index"));
  userInput.add(new Button(550, 40, 50, 30, "remove", 2));
}

//todo: use iterator
void displaySll() {
  int x = 40;
  int y = 100;
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
    if (i == sll.size() - 1)
      drawCross(x, y, x + size, y + size);
    //else draw arrow to next node
    else
      drawArrow(x + size / 2, y + size / 2, x + size * 2);
    x += size * 2;
  }
}

//draw cross with top-left (x1, y1) and bottom-right (x2, y2)
void drawCross(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  line(x1, y2, x2, y1);
}

//draw a (horizontal) arrow from (x1, y1) to (x2, y1)
void drawArrow(int x1, int y1, int x2) {
  int elevation = 8;
  line(x1, y1, x2, y1);
  //arrowhead
  line(x2, y1, x2 - elevation, y1 + elevation);
  line(x2, y1, x2 - elevation, y1 - elevation);
}

void drawArrowRight(int x1, int y1, int x2, int y2){
  int elevation = 8;
  line(x1, y1, x2, y2);
  //arrowhead
  line(x2, y1, x2 - elevation, y1 + elevation);
  line(x2, y1, x2 - elevation, y1 - elevation);
}

void drawArrowLeft(int x1, int y1, int x2, int y2){
  int elevation = 8;
  //arrowhead
  line(x1, y1, x1 + elevation, y1 + elevation);
  line(x1, y1, x1 + elevation, y1 - elevation);
  line(x1, y1, x2, y2);
}

void displayDll() {
  int x = 40;
  int y = 100;
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
    if (i == sll.size() - 1)
      drawCross(x, y, x + size, y + size);
    //else draw arrow to next node
    else{
      drawArrowRight(x + size / 2, y + 5 + size / 2, x + size * 2, y + 5 +size/ 2);
      drawArrowLeft(x + size / 2, y - 5 + size / 2, x + size * 2, y - 5 +size/2);
    }
    x += size * 2;
  }
}

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