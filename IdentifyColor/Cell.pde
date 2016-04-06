final boolean GAME_OVER = false;
final boolean NEXT_LEVEL = true;

class Cell{
  
  PVector position;
  float length;
  color col;
  boolean isDifferent;
  
  Cell(PVector p,float l,color c)
  {
    position = p.copy();
    length = l;
    col = c;
    isDifferent = false;
  }
  
  boolean isInside(int x,int y)
  {
    return (x - position.x <= length) && (y - position.y <= length);
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
    rect(position.x,position.y,length,length);
  }
}