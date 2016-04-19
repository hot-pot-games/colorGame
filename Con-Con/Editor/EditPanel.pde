class EditPanel {
  PVector position;
  PVector size;
  color bgCol;
  ArrayList<Tools> tools;

  //1格子区
  ScrollBar rowNumber = new ScrollBar(new PVector(50, 20), new PVector(200, 16), 16, 1, 50, 0);
  ScrollBar colNumber = new ScrollBar(new PVector(50, 40), new PVector(200, 16), 16, 1, 50, 0);
  okButton OKButton = new okButton(new PVector(50, 60), new PVector(200, 16), "Creat");

  //2.颜色区
  ScrollBar r = new ScrollBar(new PVector(50, 140), new PVector(200, 16), 16, 0, 255, 0);
  ScrollBar g = new ScrollBar(new PVector(50, 160), new PVector(200, 16), 16, 0, 255, 0);
  ScrollBar b = new ScrollBar(new PVector(50, 180), new PVector(200, 16), 16, 0, 255, 0);
  ScrollBar a = new ScrollBar(new PVector(50, 200), new PVector(200, 16), 16, 0, 255, 1);
  Tools fillColor = new Tools(new PVector(50, 270), new PVector(200, 16), "Fill Color", 1);
  Tools cancleColor = new Tools(new PVector(50, 290), new PVector(200, 16), "Cancle Color", 2);

  //3.设置区
  Tools setDestination = new Tools(new PVector(50, 350), new PVector(200, 16), "Destination?", 3);
  Tools hasLiveBacteria = new Tools(new PVector(50,370),new PVector(200,16),"LiveBacteria?",4);

  //4.保存数据

  EditPanel()
  {
    position = new PVector(0, 0);
    size = new PVector(300, 800);
    bgCol = color(50);
    tools = new ArrayList<Tools>();
    tools.add(fillColor);
    tools.add(cancleColor);
    tools.add(setDestination);
    tools.add(hasLiveBacteria);
  }

  void display()
  {
    //bg
    noStroke();
    fill(bgCol);
    rect(position.x, position.y, size.x, size.y);

    //1.格子区
    fill(255);
    textSize(15);
    text("row", rowNumber.position.x - 40, rowNumber.position.y, rowNumber.position.x - 10, rowNumber.position.y + 20);
    rowNumber.update();
    rowNumber.display();

    text("col", colNumber.position.x - 40, colNumber.position.y, colNumber.position.x - 10, colNumber.position.y + 20);
    colNumber.update();
    colNumber.display();

    OKButton.update();
    OKButton.display(); 

    stroke(204);
    strokeWeight(1);
    line(0, 110, size.x, 110);

    //2.颜色区
    fill(255);
    textSize(15);
    text("R", r.position.x - 40, r.position.y, r.position.x - 10, r.position.y + 20);
    r.update();
    r.display();

    text("G", g.position.x - 40, g.position.y, g.position.x - 10, g.position.y + 20);
    g.update();
    g.display();

    text("B", b.position.x - 40, b.position.y, b.position.x - 10, b.position.y + 20);
    b.update();
    b.display();

    text("A", a.position.x - 40, a.position.y, a.position.x - 10, a.position.y + 20);
    a.update();
    a.display();

    fill(color(r.getValue(), g.getValue(), b.getValue(), a.getValue()));
    rect(50, 220, 200, 32);

    fillColor.update();
    fillColor.display();
    cancleColor.update();
    cancleColor.display();

    stroke(204);
    strokeWeight(1);
    line(0, 325, size.x, 325);
   
    //3.设置区
    setDestination.update();
    setDestination.display();
    hasLiveBacteria.update();
    hasLiveBacteria.display();

    //4.保存数据
  }

  boolean isHover() 
  {
    if (mouseX > position.x && mouseX < position.x + size.x && mouseY > position.y && mouseY < position.y + size.y)
    {
      return true;
    } else
    {
      return false;
    }
  }
}