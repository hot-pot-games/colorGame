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
  tfr = new IFTextField("R",255,150,40);
  tfg = new IFTextField("G",255,180,40);
  tfb = new IFTextField("B",255,210,40);
  tfa = new IFTextField("A",255,240,40);
  
  c.add(tfr);
  c.add(tfg);
  c.add(tfb);
  c.add(tfa);
  tfr.addActionListener(this);
  tfg.addActionListener(this);
  tfb.addActionListener(this);
  tfa.addActionListener(this);
  
  tfr.setValue(ep.r.getValue() + "");
  tfg.setValue(ep.g.getValue() + "");
  tfb.setValue(ep.b.getValue() + "");
  tfa.setValue(ep.a.getValue() + "");
}

void actionPerformed(GUIEvent e)
{
  if(e.getMessage().equals("Modified"))
 {
    if(e.getSource() == tfr)
    {
      ep.r.setValue(int(tfr.getValue()));
    }
    if(e.getSource() == tfg)
    {
      ep.g.setValue(int(tfg.getValue()));
    }
    if(e.getSource() == tfb)
    {
      ep.b.setValue(int(tfb.getValue()));
    }
    if(e.getSource() == tfa)
    {
      ep.a.setValue(int(tfa.getValue()));
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
  
  if(ep.r.locked)
    tfr.setValue(ep.r.getValue() + "");
  if(ep.g.locked)
    tfg.setValue(ep.g.getValue() + "");
  if(ep.b.locked)
    tfb.setValue(ep.b.getValue() + "");
  if(ep.a.locked)
    tfa.setValue(ep.a.getValue() + "");
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