class Panel {
  float locationX;
  float locationY;
  float length;
  color col;
  ArrayList<Cell> cells;
  int intval;
  int level;
  int rowNumbers;
  int difficulty;

  Panel(float x,float y,float l, color c)
  {
    locationX = x;
    locationY = y;
    length = l;
    col = c;
    level = 1;
    rowNumbers = 2;
    difficulty = 50;
    intval = 5;
    cells = new ArrayList<Cell>();
    initialize();
  }

  void initialize()
  {
    float startPosX = locationX + intval;
    float startPosY = locationY + intval;
    float cellLength = (length - (rowNumbers + 1) * intval) / rowNumbers;
    color newColor = color(random(360), 50, 100);

    //initialize every cell
    for (int i=0, j=i; i<rowNumbers * rowNumbers; i++)
    {
      float newPosX = startPosX + (j * (cellLength + intval));
      float newPosY = startPosY + (j++ * (cellLength + intval));
      Cell newCell = new Cell(newPosX,newPosY, cellLength, newColor);
      cells.add(newCell);

      if ((i+1)%rowNumbers == 0)
      {
        startPosY += cellLength + intval;
        j = 0;
      }
    }

    //new the different one 
    int index = (int)random(rowNumbers * rowNumbers);
    color diffColor = newColor;
    if (saturation(diffColor) + difficulty <= 100)
      diffColor = color(hue(diffColor), saturation(diffColor) + difficulty, brightness(diffColor));
    else
      diffColor = color(hue(diffColor), saturation(diffColor) - difficulty, brightness(diffColor));
    cells.get(index).col = diffColor;
    cells.get(index).isDifferent = true;
  }


  void deleteCells()
  {
    cells.clear();
  }

  void display()
  {
    fill(col);
    noStroke();
    rect(locationX, locationY, length, length);

    if (cells.size() > 0)
    {
      for (int i = 0; i < cells.size(); i++)
        cells.get(i).display();
    }
  }

  void updateLevel()
  {
    level++;
  }

  void updateRowNumber()
  {
    rowNumbers++;
  }

  void updateDifficulty()
  {
    difficulty--;
  }

  boolean isInside(float x, float y)
  {
    return (x - locationX <= length) && (y - locationY <= length);
  }

  boolean clicked(float x, float y)
  {
    boolean returnValue = false;
    if (isInside(x, y) && cells.size() > 0)
    {
      for (int i=0; i<cells.size(); i++)
      {
        if (cells.get(i).isInside(x, y))
          returnValue =  cells.get(i).checkWinOrLose();
      }
    } 
    return returnValue;
  }
}