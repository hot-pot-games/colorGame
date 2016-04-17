class Button extends Clickable{
  String text;
  
  Button(PVector p,PVector s,String t)
  {
    super.position = p.copy();
    super.size = s.copy();
    text = t;
  }
  
  void update() {
    if (isHover()) 
      over = true;
    else 
      over = false;
  }
  
  void display()
  {
    noStroke();
    if (over) 
      fill(0);
    else 
      fill(102);
    rect(position.x, position.y, size.x, size.y);
  }
}