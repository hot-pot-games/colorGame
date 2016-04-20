EditPanel ep;
ArrayList<Cell> cells;
PVector startDrawPos;

void setup()
{
  size(1280, 720);
  noStroke();

  ep = new EditPanel();
  cells = new ArrayList<Cell>();
  startDrawPos = new PVector(ep.size.x + 10, 10);
}

void draw()
{
  background(230);

  ep.display();

  for (Cell c : cells)
  {
    c.display();
  }

  for (Tools t : ep.tools)
  {
    if (t.choosed)
      t.display();
  }
}

void mouseClicked()
{
  if (ep.isHover())
  {
    if (ep.OKButton.isHover())
    {
      cells.clear();
      ep.OKButton.clickEvent(ep.rowNumber.getValue(), ep.colNumber.getValue());
    }
    
    if (ep.SaveButton.isHover())
    {
      ep.SaveButton.clickEvent();
    }

    for (Tools t : ep.tools)
    {
      if (t.isHover())
      {
        t.choosed = !t.choosed;
      } else
        t.choosed = false;
    }
  } 
  else
  {
    for (Tools t : ep.tools)
    {
      if (t.choosed)
        t.clickEvent();
    }
  }
}