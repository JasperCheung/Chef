class TextBox {
  int x, y, len, wid;
  String label;
  String text = "";
  
  TextBox(int initX, int initY, int initLen, int initWid, String initLabel) {
    x = initX;
    y = initY;
    len = initLen;
    wid = initWid;
    label = initLabel;
  }
  
  void display() {
    fill(255);
    rect(x, y, len, wid / 2);
    fill(66, 134, 244);
    rect(x, y + wid / 2, len, wid / 2);
    fill(0);
    text(text, x + len / 2, y + wid / 4);
    text(label, x + len / 2,  y + wid * 3 / 4);
  }
  
  boolean contains(int pointX, int pointY) {
    return pointX > x && pointX < x + len &&
           pointY > y && pointY < y + wid;
  }
}