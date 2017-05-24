import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Stack;

ArrayList<Integer> al;
LinkedList<Integer> ll;
Stack<Integer> st;
BST bt;

void setup() {
  size(700, 700);
  background(100);
  textAlign(CENTER, CENTER);
  
  al = new ArrayList<Integer>();
  al.add(3);
  al.add(6);
  al.add(10);
  ll = new LinkedList<Integer>();
  ll.add(2);
  ll.add(5);
  ll.add(13);
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
  displayAl();
  displayLl();
  displaySt();
  displayBt();
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
void displayLl() {
  int x = 40;
  int y = 100;
  int size = 40;
  for (int i = 0; i < ll.size(); i++) {
    //draw node
    //draw square holding value
    fill(255);
    rect(x, y, size, size); 
    fill(0);
    text(ll.get(i), x + size / 2, y + size / 2);
    x += size;
    //draw square with link
    fill(255);
    rect(x, y, size, size);
    //draw cross if no next node
    if (i == ll.size() - 1)
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