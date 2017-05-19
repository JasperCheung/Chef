import java.util.ArrayList;

ArrayList<Integer> al;

void setup() {
  size(700, 700);
  al = new ArrayList<Integer>();
  al.add(3);
  al.add(6);
  al.add(10);
  for (int i : al)
    System.out.println(i);
}

void draw() {
  background(0);
  display(al);
}

void display(ArrayList<Integer> arrayList) {
  int x = 40;
  int y = 40;
  int size = 40;
  for (int i : arrayList) {
    fill(255);
    rect(x, y, size, size);
    fill(0);
    text(i, x + size / 2, y + size / 2);
    x += size;
  }
}