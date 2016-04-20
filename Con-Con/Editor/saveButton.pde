class saveButton extends Button {

  saveButton(PVector p, PVector s, String t)
  {
    super(p, s, t);
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

    for(Cell c:cells)
    {
      TableRow newRow = table.addRow();
      newRow.setFloat("PositionX",c.position.x);
      newRow.setFloat("PositionY",c.position.y);
      newRow.setFloat("ColorR",red(c.col));
      newRow.setFloat("ColorG",green(c.col));
      newRow.setFloat("ColorB",blue(c.col));
      newRow.setFloat("ColorA",alpha(c.col));
      newRow.setInt("isDestination",boolean2Int(c.isDestination));
      newRow.setInt("SpecialEvent",c.specialEvent);
      newRow.setInt("isPoisonous",boolean2Int(c.isPoisonous));
      newRow.setInt("hasViableBacteria",boolean2Int(c.hasViableBacteria));
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
    if(b)
      return 1;
    else
      return 0;
  }
}