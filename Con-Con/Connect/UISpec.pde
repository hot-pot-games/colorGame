class ChooseColorButt extends uiButton
{
  int colorIndex;
  ChooseColorButt(int pind){
    super();
    colorIndex = pind;
  }
  
  void clickEvent()
  {
    area.click();
    doEvent(value,colorIndex);
  }
}

class ChooseToolButt extends uiButton
{
  int toolsIndex;
  ChooseToolButt(int pind){
    super();
    toolsIndex = pind;
  }
  
  void clickEvent()
  {
    area.click();
    doEvent(value,toolsIndex);
  }
}


class UIfactory {
  PFont pf;
  UIset tus;

  UIfactory(UIset pus) {
    pf   = createFont("Arial", 40);
    tus  = pus;
  }

  uiButton addButton(float xx, float yy, button_type type) {
    uiButton nb = null;
    
    switch(type){      
      case COLOR_RECT_BUTT:         
        nb = new uiButton();
        nb.createRectArea(xx,yy);
        tus.add(nb);
      break;
      
      case COLOR_ELLIPSE_BUTT:     
        nb = new uiButton();
        nb.createEllipseArea(xx,yy);
        tus.add(nb);
      break;
      
      default:
      
      break;
    }
    return nb;
  }

  uiButton addButton(float xx, float yy, button_type type, function_type val) {
    uiButton nb;
    nb = addButton(xx,yy,type);
    nb.link(val);
    
    return nb;
  }
  
  uiButton addColorButton(float xx, float yy, int pcind) {
    uiButton nb;
    nb = new ChooseColorButt(pcind);
    nb.createEllipseArea(xx,yy);
    nb.link(function_type.COLOR_BUT_01);
    tus.add(nb);
    
    return nb;
  }
  
  uiButton addToolButton(float xx, float yy, int ptind) {
    uiButton nb;
    nb = new ChooseToolButt(ptind);
    nb.createEllipseArea(xx,yy);
    nb.link(function_type.TOOL_BUT_01);
    tus.add(nb);
    
    return nb;
  }
}