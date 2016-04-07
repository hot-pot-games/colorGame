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
  
<<<<<<< HEAD
  boolean isInside(float x, float y){
    if(x>locationX && x<locationX+length && y>locationY && y<locationY+length){
      return true;
    }
    else{
      return false;
    }
=======
  boolean isInside(int x,int y)
  {
    return (x - position.x <= length) && (y - position.y <= length);
>>>>>>> parent of 8d71860... 写完了 但是有bug 先传 去吃饭啦
  }
  
  
  
  void display()
  {
    fill(col);
    noStroke();
    rect(position.x,position.y,length,length);
  }
}