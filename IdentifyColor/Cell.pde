final boolean GAME_OVER = false;
final boolean NEXT_LEVEL = true;

class Cell{
  
  float locationX;
  float locationY;
  float length;
  color col;
  boolean isDifferent;
  
  Cell(float x,float y,float l,color c)
  {
    locationX = x;
    locationY = y;
    length = l;
    col = c;
    isDifferent = false;
  }
  
  boolean isInside(float x,float y)
  {
    return (x - locationX <= length) && (y - locationY <= length);
  }
  
  boolean checkWinOrLose()
  {
    if(isDifferent)
      return NEXT_LEVEL;
    else
      return GAME_OVER;
  }
  
  void display()
  {
    fill(col);
    noStroke();
    rect(locationX,locationY,length,length);
  }
}