/*
tool1：填色工具
 tool2：颜色橡皮工具
 tool3：添加/取消终点工具
 tool4：添加/取消有活菌工具
 tool5：添加/删除格子
 tool6：添加/取消有颜色的活菌
 */
class Tools extends Toggle
{
  int id;
  boolean inCellPanel = false;

  Tools(PVector p, PVector s, String t, int i)
  {
    super(p, s, t);
    this.id = i;
  }

  void display()
  {
    super.display();
    if (choosed)
    {
      switch(id)
      {
        //tool1:fill color tool
      case 1:
        fill(color(ep.r.getValue(), ep.g.getValue(), ep.b.getValue(), ep.a.getValue()));
        rect(mouseX - 5, mouseY - 5, 10, 10);
        break;
        //tool2:cancle color tool
      case 2:
        fill(color(230));
        stroke(0);
        ellipse(mouseX, mouseY, 10, 10);
        break;
        //tool3:destination
      case 3:
        fill(color(255, 0, 0));
        stroke(0);
        rect(mouseX, mouseY - 15, cellLength/3, 15);
        line(mouseX, mouseY - 15, mouseX, mouseY + 15);
        break;
        //tool4:hasLiveBacteria
      case 4:
        noFill();
        stroke(0);
        strokeWeight(2);
        ellipse(mouseX, mouseY, 45, 45);
        ellipse(mouseX, mouseY - 10, 8, 8);
        ellipse(mouseX - 10, mouseY + 10, 8, 8);
        ellipse(mouseX + 12, mouseY + 8, 8, 8);
        break;
        //tool5:add or cancle cell
      case 5:
        noFill();
        stroke(0);
        strokeWeight(2);
        for (Cell c : cells)
        {
          if (c.isInside(mouseX, mouseY))
          {
            inCellPanel = true;
            break;
          }
        }
        if (!ep.isHover())
        {
          if (inCellPanel)//在格子内显示X
          {
            line(mouseX - 5, mouseY - 5, mouseX + 5, mouseY + 5);
            line(mouseX - 5, mouseY + 5, mouseX + 5, mouseY - 5);
          }
           else//在格子外显示加和新的Cell边框
          {
            //"+"
            line(mouseX, mouseY - 5, mouseX, mouseY + 5);
            line(mouseX - 5, mouseY, mouseX + 5, mouseY);
            //"边框"
            stroke(204);
            float newPosX = startDrawPos.x + cellLength * ((int)((mouseX - startDrawPos.x)/cellLength));
            float newPosY = startDrawPos.y + cellLength * ((int)((mouseY - startDrawPos.y)/cellLength));
            rect(newPosX, newPosY, cellLength, cellLength);
          }
        }
        inCellPanel = false;
        break;
        //tool6:fill color to bacteria
      case 6:
        fill(color(ep.r.getValue(), ep.g.getValue(), ep.b.getValue(), ep.a.getValue()));
        stroke(0);
        strokeWeight(2);
        ellipse(mouseX, mouseY, 45, 45);
        ellipse(mouseX, mouseY - 10, 8, 8);
        ellipse(mouseX - 10, mouseY + 10, 8, 8);
        ellipse(mouseX + 12, mouseY + 8, 8, 8);
        break;
      }
    }
  }

  void clickEvent()
  {
    if (choosed)
    {
      switch(id)
      {
      case 1:
        println("tool1:Fill Color");
        for (Cell c : cells)
        {
          if (c.isInside(mouseX, mouseY))
          {
            c.col = color(ep.r.getValue(), ep.g.getValue(), ep.b.getValue(), ep.a.getValue());
            c.isPoisonous = true;
          }
        }
        break;
      case 2:
        println("tool2:Cancle Color");
        for (Cell c : cells)
        {
          if (c.isInside(mouseX, mouseY))
          {
            c.col = color(0, 0, 0, 0);
            c.isPoisonous = false;
          }
        }
        break;
      case 3:
        println("tool3:Set or Cancle Destination");
        for (Cell c : cells)
        {
          if (c.isInside(mouseX, mouseY))
          {
            c.isDestination = !c.isDestination;
          }
        }
        break;
      case 4:
        println("tool4:Set or Cancle LiveBacteria");
        for (Cell c : cells)
        {
          if (c.isInside(mouseX, mouseY))
          {
            c.bacteriaHasColor = false;
            c.hasViableBacteria = !c.hasViableBacteria;
          }
        }
        break;
      case 5:
        println("tool5:Add or Cancle Cell");
        for (Cell c : cells)
        {
          if (c.isInside(mouseX, mouseY))//在格子内则删除格子
          {
            inCellPanel = true;
            println(cells.size());
            cells.remove(c);
            println(cells.size());
            break;
          }
        }

        if (!inCellPanel) //在格子外添加格子
        {
          float newPosX = startDrawPos.x + cellLength * ((int)((mouseX - startDrawPos.x)/cellLength));
          float newPosY = startDrawPos.y + cellLength * ((int)((mouseY - startDrawPos.y)/cellLength));
          Cell newCell = new Cell(new PVector(newPosX, newPosY));
          cells.add(newCell);
        }

        inCellPanel = false;
        break;
      case 6:
        println("tool6:Fill Color To LiveBacteria");
        for (Cell c : cells)
        {
          if (c.isInside(mouseX, mouseY))
          {
            c.bacteriaHasColor = true;
            c.bacteriaCol = color(ep.r.getValue(), ep.g.getValue(), ep.b.getValue(), ep.a.getValue());
            c.hasViableBacteria = !c.hasViableBacteria;
          }
        }
        break;
      }
    }
  }
}