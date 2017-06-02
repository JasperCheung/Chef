import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Stack;
import java.util.ArrayDeque;

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
ArrayDeque<Integer> que;
ArrayDeque<Integer> dQue;

int startYUI = 55;

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
  structures.add(new Button(510,0,100,40, "Queue",5));
  structures.add(new Button(610,0,100,40, "Deque",5));

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
  que = new ArrayDeque<Integer>();
  que.addFirst(1);
  que.addFirst(2);
 // que.removeLast();
  que.addFirst(3);
  //que.removeFirst();
  dQue = new ArrayDeque<Integer>();
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
  case 5: 
    displayQue();
    break;
  case 6:  
    displayDque();
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
  case 5:
    displayQueUI();
    break;
  case 6:
    displayDqueUI();
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
  case 16:
    {
      Integer val = numFromTextbox(0);
      if(val == null)
        break;
        que.addFirst(val);
        break;
    }
  case 17: 
    {
      que.removeLast();
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

void displayDque(){
}

void displayDqueUI(){
}