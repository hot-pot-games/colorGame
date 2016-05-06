class ScrollBar extends Clickable{
  float spos, newspos;    // 游标的位置
  float sposMin, sposMax; // 游标的范围
  float min,max;//对应的数值的范围
  int loose;              
  boolean locked;
  float ratio;

  ScrollBar (PVector p,PVector s, int l,float min,float max,float deSPos) {
    super.size = s.copy();
    float widthtoheight = s.x - s.y;
    ratio = (float)s.x / (float)widthtoheight;
    super.position.x = p.x;
    super.position.y = p.y - s.y/2;
    spos = p.x + deSPos * (s.x - s.y - 0.01);
    newspos = spos;
    sposMin = position.x;
    sposMax = position.x + s.x - s.y;
    loose = l;
    this.min = min;
    this.max = max;
  }

  void update() {
    if (isHover()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX - size.y/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) >= 0) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(position.x, position.y, size.x, size.y);
    
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, position.y, size.y, size.y);
    
    fill(255);
    textSize(15);
    text(getValue() + "",position.x + size.x + 10,position.y,position.x + size.x + 30,position.y + 20);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
  
  int getValue()
  {
    float value = spos - position.x;
    return (int)map(value,0,size.x - size.y,min,max + 1);
  }
  
  void setValue(int value)
  {
    if(value < 0)
      value = 0;
    else if(value > 255)
      value = 255;

    spos = spos + (newspos-spos)/loose;
  }
  
}