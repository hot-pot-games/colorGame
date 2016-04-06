Cell cell;

void setup()
{
  size(500,500);
  cell = new Cell(new PVector(200,200),50,color(0,0,0));
}

void draw()
{
  background(150);
  cell.display();
}