class Button {
  int x, y, len, wid;
  String text;
  int actionID;
  
  Button(int initX, int initY, int initLen, int initWidth, String initText, int initActionID) {
    x = initX;
    y = initY;
    len = initLen;
    wid = initWidth;
    text = initText;
    actionID = initActionID;
  }
  
  int getActionID() { return actionID; }
  
  void display() {
    fill(200);
    rect(x, y, len, wid);
    fill(0);
    text(text, x + len / 2, y + wid / 2);
  }
  
  boolean contains(int pointX, int pointY) {
    return pointX > x && pointX < x + len &&
           pointY > y && pointY < y + wid;
  }
}