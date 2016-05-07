class EditPanel {
  PVector position;
  PVector size;
  color bgCol;
  ArrayList<Tools> tools;
  
  //1格子区
  ScrollBar rowNumber = new ScrollBar(new PVector(50, 20), new PVector(200, 20), 20, 1, 50, 0);
  ScrollBar colNumber = new ScrollBar(new PVector(50, 50), new PVector(200, 20), 20, 1, 50, 0);
  okButton OKButton = new okButton(new PVector(50, 80), new PVector(200, 20), "Fast Creat");
  Tools addCancleCell = new Tools(new PVector(50,110),new PVector(200,20),"Add/Cancle Cell",5);

  //2.颜色区
  ScrollBar r = new ScrollBar(new PVector(50, 160), new PVector(200, 20), 20, 0, 255, 0);
  ScrollBar g = new ScrollBar(new PVector(50, 190), new PVector(200, 20), 20, 0, 255, 0);
  ScrollBar b = new ScrollBar(new PVector(50, 220), new PVector(200, 20), 20, 0, 255, 0);
  ScrollBar a = new ScrollBar(new PVector(50, 250), new PVector(200, 20), 20, 0, 255, 1);
  Tools fillColor = new Tools(new PVector(50, 330), new PVector(200, 20), "Fill Color", 1);
  Tools cancleColor = new Tools(new PVector(50, 360), new PVector(200, 20), "Cancle Color", 2);

  //3.设置区
  Tools setDestination = new Tools(new PVector(50, 400), new PVector(200, 20), "Destination?", 3);
  Tools hasLiveBacteria = new Tools(new PVector(50,430),new PVector(200,20),"LiveBacteria?",4);
  Tools colorBacteria = new Tools(new PVector(50,460),new PVector(200,20),"Color Bacteria?",6);

  //4.保存数据
  ScrollBar level = new ScrollBar(new PVector(50, 510), new PVector(200, 20), 20, 1, 50, 0);
  saveButton SaveButton = new saveButton(new PVector(50, 530), new PVector(200, 20), "Save Datas");

  EditPanel()
  {
    position = new PVector(0, 0);
    size = new PVector(300, 800);
    bgCol = color(50);
    tools = new ArrayList<Tools>();
    tools.add(addCancleCell);
    tools.add(fillColor);
    tools.add(cancleColor);
    tools.add(setDestination);
    tools.add(hasLiveBacteria);
    tools.add(colorBacteria);
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
    addCancleCell.update();
    addCancleCell.display();

    stroke(204);
    strokeWeight(1);
    line(0, 140, size.x, 140);

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
    rect(50, 280, 200, 40);

    fillColor.update();
    fillColor.display();
    cancleColor.update();
    cancleColor.display();

    stroke(204);
    strokeWeight(1);
    line(0, 390, size.x, 390);
   
    //3.设置区
    setDestination.update();
    setDestination.display();
    hasLiveBacteria.update();
    hasLiveBacteria.display();
    colorBacteria.update();
    colorBacteria.display();
    
    stroke(204);
    strokeWeight(1);
    line(0, 490, size.x, 490);

    //4.保存数据
    fill(255);
    textSize(15);
    text("level", level.position.x - 40, level.position.y, level.position.x - 10, level.position.y + 20);
    level.update();
    level.display();
    SaveButton.update();
    SaveButton.display();
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