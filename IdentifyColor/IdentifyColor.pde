Cell cell;
Cell cell2;

void setup()
{
  size(500,500);
  colorMode(HSB, 360,100,100);
  cell = new Cell(new PVector(200,200),50,color(100,80,100));
  cell2 = new Cell(new PVector(200,250),50,color(100,100,100));
}

void draw()
{
  background(150);
  cell.display();
  
  cell2.display();
}