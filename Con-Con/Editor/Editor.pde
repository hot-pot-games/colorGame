EditPanel ep;
ArrayList<Cell> cells;
PVector startDrawPos;

void setup()
{
  size(1280,720);
  noStroke();
  
  ep = new EditPanel();
  cells = new ArrayList<Cell>();
  startDrawPos = new PVector(ep.size.x + 10,10);
}

void draw()
{
  background(255);
  
  ep.display();
  
  for(Cell c:cells)
  {
    c.display();
  }
}

void mousePressed()
{
  
}