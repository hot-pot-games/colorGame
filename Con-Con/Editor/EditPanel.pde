class EditPanel{
  PVector position;
  PVector size;
  color bgCol;
  
  //1格子区
  ScrollBar rowNumber = new ScrollBar(new PVector(50,20),new PVector(200,16),16,1,50);
  ScrollBar colNumber = new ScrollBar(new PVector(50,40),new PVector(200,16),16,1,50);
  okButton OKButton = new okButton(new PVector(50,60),new PVector(200,16),"Creat");
  
  //2.颜色区
  ScrollBar r = new ScrollBar(new PVector(50,140),new PVector(200,16),16,0,255);
  ScrollBar g = new ScrollBar(new PVector(50,160),new PVector(200,16),16,0,255);
  ScrollBar b = new ScrollBar(new PVector(50,180),new PVector(200,16),16,0,255);
  
  //3.设置区
  //4.保存数据
  
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
    
    //1.格子区
    fill(255);
    textSize(15);
    text("row",rowNumber.position.x - 40,rowNumber.position.y,rowNumber.position.x - 10,rowNumber.position.y + 20);
    rowNumber.update();
    rowNumber.display();
    
    text("col",colNumber.position.x - 40,colNumber.position.y,colNumber.position.x - 10,colNumber.position.y + 20);
    colNumber.update();
    colNumber.display();
    
    OKButton.update();
    OKButton.display(); 
    
    stroke(204);
    strokeWeight(1);
    line(0,110,size.x,110);
    
    //2.颜色区
    fill(255);
    textSize(15);
    text("R",r.position.x - 40,r.position.y,r.position.x - 10,r.position.y + 20);
    r.update();
    r.display();
    
    text("G",g.position.x - 40,g.position.y,g.position.x - 10,g.position.y + 20);
    g.update();
    g.display();
    
    text("B",b.position.x - 40,b.position.y,b.position.x - 10,b.position.y + 20);
    b.update();
    b.display();
    
    //3.设置区
    //4.保存数据
  }
}