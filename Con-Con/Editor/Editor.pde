import interfascia.*;

GUIController c;
IFTextField tfr;
IFTextField tfg;
IFTextField tfb;
IFTextField tfa;

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
  
  c = new GUIController(this);
  tfr = new IFTextField("R",260,150,30);
  tfg = new IFTextField("G",260,180,30);
  tfb = new IFTextField("B",260,210,30);
  tfa = new IFTextField("A",260,240,30);
  
  c.add(tfr);
  c.add(tfg);
  c.add(tfb);
  c.add(tfa);
  tfr.addActionListener(this);
  tfg.addActionListener(this);
  tfb.addActionListener(this);
  tfa.addActionListener(this);
}

void actionPerformed(GUIEvent e)
{
  if(e.getMessage().equals("Modified"))
 {
    if(e.getSource() == tfr)
    {
      
    }
 }
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