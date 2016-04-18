abstract class Clickable{
  PVector position = new PVector(0,0);
  PVector size = new PVector(0,0);
  boolean over = false;
  boolean pressed = false;
  //boolean released = false;
  
  abstract void update();
  abstract void display();
  
  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }
  
  boolean isHover() 
  {
    if (mouseX > position.x && mouseX < position.x + size.x && mouseY > position.y && mouseY < position.y + size.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean hasPressed()
  {
    if(isHover() && mousePressed)
    {
      return true;
    }
    else
      return false;
  }
  /*
  boolean hasReleased()
  {
    if(isHover() && !mousePressed)
    {
      return true;
    }
    else
      return false;
  }*/
}