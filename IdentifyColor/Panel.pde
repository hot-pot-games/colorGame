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
    for(int i=0; i<rowNumbers; i++)
    {
<<<<<<< HEAD
      for(int j=0; j<rowNumbers; j++)
      {
        float newPosX = startPosX + (i * (cellLength + intval));
        float newPosY = startPosY + (j * (cellLength + intval));
        Cell newCell = new Cell(newPosX,newPosY, cellLength, newColor);
        cells.add(newCell);
=======
      PVector newPos = startPos.add(new PVector(j++ * (cellLength + intval), 0));
      Cell newCell = new Cell(newPos, cellLength, newColor);
      cells.add(newCell);

      if ((i+1)%rowNumbers == 0)
      {
        startPos.add(new PVector(0, cellLength + intval));
        j = 0;
>>>>>>> parent of 8d71860... 写完了 但是有bug 先传 去吃饭啦
      }
    }

    //new the different one 
    int index = (int)random(0,cells.size());
    color diffColor = newColor;
    if (saturation(diffColor) + difficulty <= 100)
     diffColor = (saturation(diffColor) + difficulty);
    else
<<<<<<< HEAD
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
    difficulty-=2;
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
          returnValue =  cells.get(i).isDifferent;
      }
    } 
    return returnValue;
  }
=======
     diffColor.setSaturation(saturation(diffColor) - difficulty);
    //diffColor.setBrightness(saturation(diffColor) + difficulty);
    cells[index].setColor(diffColor);
    cells[index].setDifferent(true);
    }
  }
>>>>>>> parent of 8d71860... 写完了 但是有bug 先传 去吃饭啦
}