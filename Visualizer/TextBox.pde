class TextBox {
  int x, y, len, wid;
  String text = "";
  
  TextBox(int initX, int initY, int initLen, int initWid) {
    x = initX;
    y = initY;
    len = initLen;
    wid = initWid;
  }
  
  void display() {
    fill(255);
    rect(x, y, len, wid);
    fill(0);
    text(text, x + len / 2, y + wid / 2);
  }
  
  boolean contains(int pointX, int pointY) {
    return pointX > x && pointX < x + len &&
           pointY > y && pointY < y + wid;
  }
}