class okButton extends Button {
  
  okButton(PVector p, PVector s, String t)
  {
    super(p, s, t);
  }

  void clickEvent(int r, int c)
  {
    for (int i = 0; i < r; i++)
    {
      for (int j = 0; j < c; j++)
      {
        Cell newCell = new Cell(new PVector(startDrawPos.x + j * cellLength, startDrawPos.y + i * cellLength));
        cells.add(newCell);
      }
    }
  }

  void display()
  {
    super.display();
    fill(50);
    textSize(15);
    text(text, position.x + size.x/3, position.y, position.x + size.x, position.y + size.y);
  }
}