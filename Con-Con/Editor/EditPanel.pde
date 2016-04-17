class EditPanel{
  PVector position;
  PVector size;
  color bgCol;
  
  //1
  ScrollBar rowNumber = new ScrollBar(new PVector(50,20),new PVector(200,16),16,1,50);
  ScrollBar colNumber = new ScrollBar(new PVector(50,40),new PVector(200,16),16,1,50);
  
  EditPanel()
  {
    position = new PVector(0,0);
    size = new PVector(300,800);
    bgCol = color(50);
  }
  
  void display()
  {
    //bg
    noStroke();
    fill(bgCol);
    rect(position.x,position.y,size.x,size.y);
    
    //新建格子区
    fill(255);
    textSize(15);
    text("row",10,10,30,30);
    rowNumber.update();
    rowNumber.display();
    
    text("col",10,30,30,50);
    colNumber.update();
    colNumber.display();
  }
}