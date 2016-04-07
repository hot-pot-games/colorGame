<<<<<<< HEAD
final boolean RUNNING = true;

Panel panel;
boolean gameState;
int    timer;
int    maxTime;
String lv;
String time;

void setup()
{
  size(800, 900);
  colorMode(HSB, 360, 100, 100);
  gameState = RUNNING;
  panel = new Panel(100, 200, 600, color(0, 0, 0));
  lv = "Lv:" + panel.level;
  maxTime = 15*1000;
  timer   = millis();
  time = "Time:" + (maxTime-(millis()-timer))/1000f;
=======
Cell cell;
Cell cell2;

void setup()
{
  size(500,500);
  colorMode(HSB, 360,100,100);
  cell = new Cell(new PVector(200,200),50,color(100,80,100));
  cell2 = new Cell(new PVector(200,250),50,color(100,100,100));
>>>>>>> parent of 8d71860... 写完了 但是有bug 先传 去吃饭啦
}

void draw()
{
  background(150);
<<<<<<< HEAD
  //update
  if (millis()-timer>maxTime)
    gameState = GAME_OVER;

  if (gameState == GAME_OVER)
  {
    timer = millis()-maxTime;
    panel.deleteCells();
  }

  //display
  panel.display();
  fill(color(360, 100, 100));
  textSize(30);
  lv = "Lv:" + panel.level;
  text(lv, 550, 120, 580, 150);
  time = "Time:" + (maxTime-(millis()-timer))/1000f;
  if(gameState == GAME_OVER){
    time = "Time:" + 0;
  }
  text(time, 150, 120, 220, 150);

  if (gameState == GAME_OVER)
  {
    fill(color(360, 100, 100));
    textSize(100);
    textAlign(CENTER,CENTER);
    text("GAME OVER",400,500);
    textAlign(LEFT);
  }
}

void mousePressed()
{
  if (panel.clicked(mouseX, mouseY))
  {
    panel.updateLevel();
    panel.updateRowNumber();
    panel.updateDifficulty();
    panel.deleteCells();
    panel.initialize();
    timer = millis();
  } 
  else if (panel.isInside(mouseX, mouseY))
  {
    gameState = GAME_OVER;
  }
=======
  cell.display();
  
  cell2.display();
>>>>>>> parent of 8d71860... 写完了 但是有bug 先传 去吃饭啦
}