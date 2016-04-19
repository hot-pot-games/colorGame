class Toggle extends Clickable {
  String text;
  boolean choosed;

  Toggle(PVector p, PVector s, String t)
  {
    super.position = p.copy();  
    super.size = s.copy();
    text = t;
    this.choosed = false;
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

    if (choosed) 
      fill(0);
    else if (over)
      fill(102);
    else
      fill(204);
    rect(position.x, position.y, size.x, size.y);
    
    fill(255);
    textSize(15);
    text(text, position.x + size.x/4, position.y, position.x + size.x, position.y + size.y);
  }
}