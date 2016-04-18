 class Button extends Clickable{
  String text;
  
  Button(PVector p,PVector s,String t)
  {
    super.position = p.copy();
    super.size = s.copy();
    text = t;
  }
  
  void update() {
     if(mousePressed)
     {
       if(isHover())
       {
         pressed = true;
         over = false;  
       }
     }
     else if(isHover())
     {
       pressed = false;
       over = true;
     }
     else
     {
       pressed = false;
       over = false;
     }
  }
  
  void display()
  {
    noStroke();
 
    if (pressed) 
      fill(0);
    else if(over)
      fill(102);
    else
      fill(204);
    rect(position.x, position.y, size.x, size.y);
  }
}