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
  size(850, 800);
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
  sll.add(9);
  sll.add(10);
  sll.add(88);
  sll.add(90);
  sll.add(70);
  sll.add(60);
  sll.add(000);
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
      changeStructure(b.actionID);
  }//BUTTON TEXT BOX
  for (Button b : userInput) {
    if (b.contains(mouseX, mouseY))
      buttonAction(b.actionID);
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
  case 1: 
    displaySllUI();
    break;
  case 2:
    displayDllUI();
    break;
  case 3:
    displayStUI();
    break;
  case 4: 
    displayBtUI();
    break;
  }
}

void buttonAction(int actionID) {
  switch(actionID) {
    //arrayList
    //Add
  case 0: 
    {
      Integer num = numFromTextbox(0);
      if (num == null)
        break;
      al.add(num);
      break;
    }
    //add at index
  case 1: 
    {
      Integer ind = numFromTextbox(1);
      Integer val = numFromTextbox(2);
      if (ind == null || ind >= al.size() || val == null)
        break;
      al.add(ind, val);
      break;
    }
    //remove 
  case 2: 
    {
      Integer ind = numFromTextbox(3);
      if (ind == null || ind >= al.size())
        break;
      al.remove((int)(ind));
      break;
    }
    //set
  case 3: 
    {
      Integer ind = numFromTextbox(4);
      Integer val = numFromTextbox(5);
      if (ind == null || ind >= al.size() || val == null)
        break;
      al.set(ind, val);
      break;
    }
    //singly-linked list 
    //add
  case 4: 
    {
      Integer num = numFromTextbox(0);
      if (num == null)
        break;
      sll.add(num);
      break;
    }
    //add-at-index
  case 5: 
    {
      Integer ind = numFromTextbox(1);
      Integer val = numFromTextbox(2);
      if (ind == null || ind >= sll.size() || val == null)
        break;
      sll.add(ind, val);
      break;
    }
    //remove
  case 6: 
    {
      Integer ind = numFromTextbox(3);
      if (ind == null || ind >= sll.size())
        break;
      sll.remove((int)(ind));
      break;
    }
    //set
  case 7: 
    {
      Integer ind = numFromTextbox(4);
      Integer val = numFromTextbox(5);
      if (ind == null || ind >= sll.size() || val == null)
        break;
      sll.set(ind, val);
      break;
    } 
    //DLL
    //add
  case 8: 
    {
      Integer num = numFromTextbox(0);
      if (num == null)
        break;
      dll.add(num);
      break;
    }
    //add-at-index
  case 9: 
    {
      Integer ind = numFromTextbox(1);
      Integer val = numFromTextbox(2);
      if (ind == null || ind >= dll.size() || val == null)
        break;
      dll.add(ind, val);
      break;
    }
    //remove
  case 10: 
    {
      Integer ind = numFromTextbox(3);
      if (ind == null || ind >= dll.size())
        break;
      dll.remove((int)(ind));
      break;
    }
    //set
  case 11: 
    {
      Integer ind = numFromTextbox(4);
      Integer val = numFromTextbox(5);
      if (ind == null || ind >= dll.size() || val == null)
        break;
      dll.set(ind, val);
      break;
    } 
    //STACKS!!!
    //push
  case 12: 
    {
      Integer val = numFromTextbox(0);
      if (val == null)
        break;
      st.push(val);
      break;
    }
  case 13:
    if (!st.empty())
      st.pop();
    break;
  case 14:
    {
    Integer val = numFromTextbox(0);
    if (val == null)
      break;
    bt.insert(val);
    break;
    }
  case 15:
    {
      Integer val = numFromTextbox(1);
      if (val == null)
        break;
      bt.remove(val);
      break;
    }
  default:
    System.out.println("Unknown actionID");
  }
}

//return null if failure
private Integer numFromTextbox(int numTextBox) {
  String text = textBoxes.get(numTextBox).text;
  if (text.equals(""))
    return null;
  // catch exception if text is not valid int (for now)
  try {
    return Integer.parseInt(text);
  } 
  catch (NumberFormatException e) {
    return null;
  }
}

void displayAl() {
  int x = 40;
  int y = 200;
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
  textBoxes.add(new TextBox(0, 75, 100, 60, "value"));
  userInput.add(new Button(100, 75, 50, 30, "add", 0));

  textBoxes.add(new TextBox(150, 75, 100, 60, "index"));
  textBoxes.add(new TextBox(250, 75, 100, 60, "value"));
  userInput.add(new Button(350, 75, 100, 30, "add-at-index", 1));

  textBoxes.add(new TextBox(450, 75, 100, 60, "index"));
  userInput.add(new Button(550, 75, 50, 30, "remove", 2));

  textBoxes.add(new TextBox(600, 75, 100, 60, "index"));
  textBoxes.add(new TextBox(700, 75, 100, 60, "value"));
  userInput.add(new Button(800, 75, 50, 30, "set", 3));
}

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
  textBoxes.add(new TextBox(0, 75, 100, 60, "value"));
  userInput.add(new Button(100, 75, 50, 30, "add", 4));

  textBoxes.add(new TextBox(150, 75, 100, 60, "index"));
  textBoxes.add(new TextBox(250, 75, 100, 60, "value"));
  userInput.add(new Button(350, 75, 100, 30, "add-at-index", 5));

  textBoxes.add(new TextBox(450, 75, 100, 60, "index"));
  userInput.add(new Button(550, 75, 50, 30, "remove", 6));

  textBoxes.add(new TextBox(600, 75, 100, 60, "index"));
  textBoxes.add(new TextBox(700, 75, 100, 60, "value"));
  userInput.add(new Button(800, 75, 50, 30, "set", 7));
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

void displayDll() {
  int x = 40;
  int y = 200;
  int size = 40;
  for (int i = 0; i < dll.size(); i++) {
    //draw node
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
    if (i == dll.size() - 1)
      drawCross(x, y, x + size, y + size);
    //else draw arrow to next node
    else {
      int heightDif = 6;
      drawArrow(x + size / 2, y + size / 2 - heightDif, x + size * 2, y + size / 2 - heightDif);
      drawArrow(x + size * 2, y + size / 2 + heightDif, x + size / 2, y + size / 2 + heightDif);
    }
    x += size * 2;
  }
}
void displayDllUI() {
  textBoxes.add(new TextBox(0, 75, 100, 60, "value"));
  userInput.add(new Button(100, 75, 50, 30, "add", 8));

  textBoxes.add(new TextBox(150, 75, 100, 60, "index"));
  textBoxes.add(new TextBox(250, 75, 100, 60, "value"));
  userInput.add(new Button(350, 75, 100, 30, "add-at-index", 9));

  textBoxes.add(new TextBox(450, 75, 100, 60, "index"));
  userInput.add(new Button(550, 75, 50, 30, "remove", 10));

  textBoxes.add(new TextBox(600, 75, 100, 60, "index"));
  textBoxes.add(new TextBox(700, 75, 100, 60, "value"));
  userInput.add(new Button(800, 75, 50, 30, "set", 11));
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

void displayStUI() {
  textBoxes.add(new TextBox(0, 75, 100, 60, "value"));
  userInput.add(new Button(100, 75, 50, 30, "push", 12));

  userInput.add(new Button(400, 75, 100, 100, "pop!!!", 13));
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

  void displayBtUI() {
  textBoxes.add(new TextBox(0, 75, 100, 60, "value"));
  userInput.add(new Button(100, 75, 50, 30, "insert", 14));
 
  textBoxes.add(new TextBox(150, 75, 100, 60, "value"));
  userInput.add(new Button(250, 75, 50, 30, "remove", 15));

}