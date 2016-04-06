class Panel {
  PVector position;
  float length;
  color col;
  ArrayList<Cell> cells;
  int intval;
  int level;
  int rowNumbers;
  int difficulty;

  Panel(PVector p, float l, color c)
  {
    level = 1;
    rowNumbers = 2;
    difficulty = 50;
    intval = 5;
    initialize();
  }

  void initialize()
  {
    PVector startPos = position.add(new PVector(intval, intval));
    float cellLength = (length - (rowNumbers + 1) * intval) / rowNumbers;
    color newColor = color(random(360), 50, 100);

    //initialize every cell
    for (int i=0, j=i; i<rowNumbers * rowNumbers; i++)
    {
      PVector newPos = startPos.add(new PVector(j++ * (cellLength + intval), 0));
      Cell newCell = new Cell(newPos, cellLength, newColor);
      cells.add(newCell);

      if ((i+1)%rowNumbers == 0)
      {
        startPos.add(new PVector(0, cellLength + intval));
        j = 0;
      }
    }

    //new the different one 
    int index = (int)random(rowNumbers * rowNumbers);
    color diffColor = newColor;
    if (saturation(diffColor) + difficulty <= 100)
     diffColor.setSaturation(saturation(diffColor) + difficulty);
    else
     diffColor.setSaturation(diffColor.getSaturation() - difficulty);
    //diffColor.setBrightness(diffColor.getSaturation() + difficulty);
    cells[index].setColor(diffColor);
    cells[index].setDifferent(true);
    }
  }
}