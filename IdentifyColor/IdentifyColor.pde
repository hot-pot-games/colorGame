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
  maxTime = 115*1000;
  timer   = millis();
  time = "Time:" + (maxTime-(millis()-timer))/1000f;
}

void draw()
{
  background(150);
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
  text(time, 150, 120, 220, 150);

  if (gameState == GAME_OVER)
  {
    fill(color(360, 100, 100));
    textSize(100);
    text("GAME OVER", 200, 500);
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
    println("wrong");
  }
}