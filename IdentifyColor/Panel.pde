final int Win = 3;

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
    color newColor = color(random(360), 49, 100);

    //initialize every cell
    for(int i=0; i<rowNumbers; i++)
    {
      for(int j=0; j<rowNumbers; j++)
      {
        float newPosX = startPosX + (i * (cellLength + intval));
        float newPosY = startPosY + (j * (cellLength + intval));
        Cell newCell = new Cell(newPosX,newPosY, cellLength, newColor);
        cells.add(newCell);
      }
    }

    //new the different one 
    int index = (int)random(0,cells.size());
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
      difficulty -= 2;
  }

  boolean isInside(float x, float y){
    if(x>locationX && x<locationX+length && y>locationY && y<locationY+length){
      return true;
    }
    else{
      return false;
    }
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
  
  void restart()
  {
    level = 1;
    rowNumbers = 2;
    difficulty = 50;
    deleteCells();
    initialize();
  }
  
  void continueGame()
  {
    level = 26;
    rowNumbers = 20;
    difficulty = 4;
    deleteCells();
    initialize();
  }
}