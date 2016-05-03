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
        if (c.position.x < minX)
          minX = c.position.x;
        if (c.position.x > maxX)
          maxX = c.position.x;
        if (c.position.y < minY)
          minY = c.position.y;
        if (c.position.x > maxY)
          maxY = c.position.y;
      }
      //计算数组的长宽
      xLength = int((maxX - minX)/cellLength);
      yLength = int((maxY - minY)/cellLength);
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
          int x = int((c.position.x - minX)/cellLength) - 1;
          int y = int((c.position.y - minY)/cellLength) - 1;
          cs[x][y] = "2:" + red(c.col)/255.0f + ":" + green(c.col)/255.0f + ":" + blue(c.col)/255.0f;
        } else
        {
          int x = int((c.position.x - minX)/cellLength) - 1;
          int y = int((c.position.y - minY)/cellLength) - 1;
          cs[x][y] = "1";
        }
      }
      //将数组其余部分置为0
      for (int m = 0; m < xLength; m++) 
      {
        for (int n = 0; n < yLength; n++) 
        {
          if(cs[m][n] == null)
            cs[m][n] = "0";
        }
      }
    }
  }

  void clickEvent()
  {
    Table table = new Table();
    table.addColumn("PositionX");
    table.addColumn("PositionY");
    table.addColumn("ColorR");
    table.addColumn("ColorG");
    table.addColumn("ColorB");
    table.addColumn("ColorA");
    table.addColumn("isDestination");
    table.addColumn("SpecialEvent");
    table.addColumn("isPoisonous");
    table.addColumn("hasViableBacteria");

    for (Cell c : cells)
    {
      TableRow newRow = table.addRow();
      newRow.setFloat("PositionX", c.position.x);
      newRow.setFloat("PositionY", c.position.y);
      newRow.setFloat("ColorR", red(c.col));
      newRow.setFloat("ColorG", green(c.col));
      newRow.setFloat("ColorB", blue(c.col));
      newRow.setFloat("ColorA", alpha(c.col));
      newRow.setInt("isDestination", boolean2Int(c.isDestination));
      newRow.setInt("SpecialEvent", c.specialEvent);
      newRow.setInt("isPoisonous", boolean2Int(c.isPoisonous));
      newRow.setInt("hasViableBacteria", boolean2Int(c.hasViableBacteria));
    }

    saveTable(table, "data/level" + ep.level.getValue() + ".csv");
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