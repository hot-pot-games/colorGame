final int GAME_OVER = 0;
final int NEXT_LEVEL = 1;

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
  
  boolean isInside(float x, float y){
    if(x>locationX && x<locationX+length && y>locationY && y<locationY+length){
      return true;
    }
    else{
      return false;
    }
  }
  
  
  
  void display()
  {
    fill(col);
    noStroke();
    rect(locationX,locationY,length,length);
  }
}