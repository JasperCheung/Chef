import java.util.ArrayList;
import java.util.LinkedList;

ArrayList<Integer> al;
LinkedList<Integer> ll;

void setup() {
  size(700, 700);
  al = new ArrayList<Integer>();
  al.add(3);
  al.add(6);
  al.add(10);
  ll = new LinkedList<Integer>();
  ll.add(2);
  ll.add(5);
  ll.add(13);
}

void draw() {
  background(100);
  textAlign(CENTER, CENTER);
  display(al);
  display(ll);
}

void display(ArrayList<Integer> arrayList) {
  int x = 40;
  int y = 40;
  int size = 40;
  for (int i : arrayList) {
    fill(255);
    rect(x, y, size, size); //draw square
    fill(0);
    text(i, x + size / 2, y + size / 2);
    x += size;
  }
}

//todo: use iterator
void display(LinkedList<Integer> linkedList) {
  int x = 40;
  int y = 100;
  int size = 40;
  for (int i = 0; i < linkedList.size(); i++) {
    //draw node
    //draw square holding value
    fill(255);
    rect(x, y, size, size); 
    fill(0);
    text(linkedList.get(i), x + size / 2, y + size / 2);
    x += size;
    //draw square with link
    fill(255);
    rect(x, y, size, size);
    //draw cross if no next node
    if (i == linkedList.size() - 1)
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