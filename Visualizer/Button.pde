class Button {
  int x, y, len, wid;
  int actionID;
  
  Button(int initX, int initY, int initLen, int initWidth, int initActionID) {
    x = initX;
    y = initY;
    len = initLen;
    wid = initWidth;
    actionID = initActionID;
  }
  
  int getActionID() { return actionID; }
  void display() {
    fill(200);
    rect(x, y, len, wid);
  }
  
  boolean contains(int pointX, int pointY) {
    return pointX > x && pointX < x + len &&
           pointY > y && pointY < y + wid;
  }
}