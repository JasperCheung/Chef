import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Stack;

ArrayList<Button> buttons;

//state for which dataStructure to display
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

  //buttons
  buttons = new ArrayList<Button>();
  buttons.add(new Button(0, 0, 80, 40, "ArrayList", 0));
  buttons.add(new Button(80, 0, 130, 40, "Singly-Linked List", 1));
  buttons.add(new Button(210, 0, 150, 40, "Doubly-Linked List", 2));
  buttons.add(new Button(350, 0, 60, 40, "Stack", 3));
  buttons.add(new Button(410, 0, 100, 40, "Binary Tree", 4));
  
  dataStructure = 0;
  
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
  for (Button b : buttons)
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
  for (Button b : buttons) {
    //if pressed, do the action with the actionId
    if (b.contains(mouseX, mouseY))
      buttonAction(b.getActionID());
  }
}

void buttonAction(int actionID) {
  switch(actionID) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      dataStructure = actionID;
      break;
    default:
      System.out.println("Unknown actionID");
  }
}

void displayAl() {
  int x = 40;
  int y = 40;
  int size = 40;
  for (int i : al) {
    fill(255);
    rect(x, y, size, size); //draw square
    fill(0);
    text(i, x + size / 2, y + size / 2);
    x += size;
  }
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
  int height = 8;
  line(x1, y1, x2, y1);
  //arrowhead
  line(x2, y1, x2 - height, y1 + height);
  line(x2, y1, x2 - height, y1 - height);
}

void displayDll() {
  
}

//draw boxes from the bottom to the top
void displaySt() {
  int x = 40;
  int y = 600;
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
  float x = 400;
  float y = 200;
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