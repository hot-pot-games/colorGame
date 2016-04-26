//基础区域

//矩形区域
class RectArea{
  PVector pos;
  PVector size;
  
  RectArea(float xx,float yy,float ww, float hh){
    pos  = new PVector(xx,yy);
    size = new PVector(ww,hh);
  }
  
   RectArea(PVector ppos, PVector psize){
    pos     = ppos.copy();
    size    = psize.copy();
  }
  
  boolean isIn(float mx, float my){
    if(mx>pos.x && mx<pos.x+size.x && my>pos.y && my<pos.y+size.y){
      return true;
    }
    else{
      return false;
    }
  }
}

//这里的KnowMouseArea和Clickable在结构上十分相像
//但是为了整体的低耦合性必须要分出来，即：绘图与逻辑分开

//绘制接口
interface KnowMouseArea
{
  boolean isIn(float mx, float my);
  void    draw();
  void    click();
  void    drag();
  void    release();
}


//用多种颜色绘制的矩形区域（能感知到鼠标）
class ColorSetRectArea extends RectArea implements KnowMouseArea
{
  //常量
  final  color  default_base_color            = color(255);
  final  color  default_hover_color           = color(100);
  final  color  default_clicked_color         = color(0);
  final  color  default_text_base_color       = color(0);
  final  color  default_text_hover_color      = color(0);
  final  color  default_text_clicked_color    = color(255);
  final  String default_str                   = "Butt";
  final  int    default_font_size             = 24;
  
  
  String str;
  int    fontSize;
  color  baseCol;
  color  hoverCol;
  color  clickedCol;
  color  textBaseCol;
  color  textHoverCol;
  color  textClickedCol;
  
  boolean isInside;
  boolean isClicked;
  PFont   sysFont;
  
  void setDefaults(){
    baseCol        = default_base_color;
    hoverCol       = default_hover_color;
    clickedCol     = default_clicked_color;
    textBaseCol    = default_text_base_color;
    textHoverCol   = default_text_hover_color;
    textClickedCol = default_text_clicked_color;
    str            = default_str;
    fontSize       = default_font_size;
    sysFont        = null;
  }
  
  
  ColorSetRectArea(float xx,float yy,float ww, float hh){
    super(xx,yy,ww,hh);
    setDefaults();
  }
  
  ColorSetRectArea(PVector ppos, PVector psize){
    super(ppos,psize);
    setDefaults();
  }
  
  ColorSetRectArea setFont(PFont pf){
    sysFont = pf;
    return this;
  }
  
  boolean isIn(float mx, float my){
    isInside = super.isIn(mx,my);
    return isInside;
  }
  
  void click(){
    isClicked = true;
  }
  
  void drag(){
  
  }
  
  void release(){
    isClicked = false;
  }
  
  void draw(){
    pushMatrix();
    
    translate(pos.x,pos.y);
    
    noStroke();
    
    fill(baseCol);
    if(isInside)  fill(hoverCol);
    if(isClicked) fill(clickedCol);
    
    rect(0,0,size.x,size.y);
    
    fill(textBaseCol);
    if(isInside)  fill(textHoverCol);
    if(isClicked) fill(textClickedCol);
    if(sysFont!=null)
    {
      textFont(sysFont,fontSize);
    }
    else{
      textSize(fontSize);
    }
    textAlign(CENTER);
    text(str,size.x/2,size.y/1.2);
    
    popMatrix();
  }
}

//枚举类型 button_type_enum
public enum button_type{
  DEFAULT_BUTT,IMAGE_BUTT;
}


class uiButton implements Clickable
{
  //常量
  static final float default_w = 80;
  static final float default_h = 30;
  
  KnowMouseArea area;
  function_type value;
  
  uiButton(float xx, float yy)
  {
    area  = new ColorSetRectArea(xx,yy,default_w,default_h);
    value = function_type.NONE;
  }
  
  uiButton link(function_type val){
    value = val;
    return this;
  }
  
  boolean isIn(float mx, float my)
  {
    return area.isIn(mx,my);  
  }
  
  void draw()
  {
    area.draw();
  }
  void clickEvent()
  {
    area.click();
    doEvent(value);
  }
  
  void releaseEvent()
  {
    area.release();
  }
}

class UIfactory{
  PFont pf;
  UIset tus;
  
  UIfactory(UIset pus){
    pf   = createFont("Arial",40);
    tus  = pus;
  }
  
  void addButton(float xx, float yy){
    uiButton nb = new uiButton(xx,yy);
    tus.add(nb);
  }
  
  void addButton(float xx, float yy,function_type val){
    uiButton nb = new uiButton(xx,yy).link(val);
    tus.add(nb);
  }
}