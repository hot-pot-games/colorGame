class saveButton extends Button {
  float minX, maxX, minY, maxY;
  int xLength, yLength;
  String[][] cs;

  saveButton(PVector p, PVector s, String t)
  {
    super(p, s, t);
    minX = width;
    maxX = 0;
    minY = height;
    maxY = 0;
    xLength = 0;
    yLength = 0;
  }

  void getData()
  {
    //得到最大最小的posxy值
    if (cells.size() > 0)
    {
      for (Cell c : cells)
      {
        if (c.position.x <= minX)
          minX = c.position.x;
        if (c.position.x >= maxX)
          maxX = c.position.x;
        if (c.position.y <= minY)
          minY = c.position.y;
        if (c.position.y >= maxY)
          maxY = c.position.y;
      }
      //计算数组的长宽
      yLength = int((maxX - minX)/cellLength) + 1;
      xLength = int((maxY - minY)/cellLength) + 1;
      println("xLength:" + xLength + " yLength:" + yLength);
      //初始化数组
      cs = new String[xLength][];
      for (int m = 0; m < xLength; m++) 
      {
        cs[m] = new String[yLength];
        for (int n = 0; n < yLength; n++) 
        {
          cs[m][n] = null;
        }
      }
      //在数组中存入数据
      for (Cell c : cells)
      {
        if (c.col != color(0, 0, 0, 0))
        {
          int y = int((c.position.x - minX)/cellLength);
          int x = int((c.position.y - minY)/cellLength);
          cs[x][y] = "2:" + red(c.col)/255.0f + ":" + green(c.col)/255.0f + ":" + blue(c.col)/255.0f;
        } else
        {
          int y = int((c.position.x - minX)/cellLength);
          int x = int((c.position.y - minY)/cellLength);
          cs[x][y] = "1";
        }
      }
      //将数组其余部分置为0
      for (int m = 0; m < xLength; m++) 
      {
        for (int n = 0; n < yLength; n++) 
        {
          if (cs[m][n] == null)
            cs[m][n] = "0";
        }
      }
    }
  }

  void clickEvent()
  {
    getData();
    Table cellTable = new Table();
    Table sysTable = new Table();

    for (int m = 0; m < xLength; m++) 
    {
      TableRow newRow = cellTable.addRow();
      for (int n = 0; n < yLength; n++)
      {
        String colu = n + "";
        newRow.setString(colu,cs[m][n]);
      }
    }   
    
    for(Cell c:cells)
    {
      int y = int((c.position.x - minX)/cellLength);
      int x = int((c.position.y - minY)/cellLength);
      if(c.hasViableBacteria)
      {
        TableRow newRow = sysTable.addRow();
        newRow.setString(0,"1:" + x + ":" + y + ":" + 
        red(c.bacteriaCol)/255.0f + ":" + green(c.bacteriaCol)/255.0f + ":" + blue(c.bacteriaCol)/255.0f);
      }
      if(c.isDestination)
      {
        TableRow newRow = sysTable.addRow();
        newRow.setString(0,"2:" + x + ":" + y);
      }
    }
    
    saveTable(cellTable, "data/level" + ep.level.getValue() + "_cell.csv");
    saveTable(sysTable, "data/level" + ep.level.getValue() + "_sys.csv");
  }

  void display()
  {
    super.display();
    fill(50);
    textSize(15);
    text(text, position.x + size.x/3, position.y, position.x + size.x, position.y + size.y);
  }

  int boolean2Int(boolean b)
  {
    if (b)
    return 1;
    else
      return 0;
  }
}