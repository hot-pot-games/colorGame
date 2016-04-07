final boolean RUNNING = true;

Panel panel;
boolean gameState;
float timer;
String lv;
String time;

void setup()
{
  size(800, 900);
  colorMode(HSB, 360, 100, 100);
  timer = 15.0f;
  gameState = RUNNING;
  panel = new Panel(100,200,600, color(0, 0, 0));
  lv = new String("Lv:") + panel.level;
  time = new String("Time:") + timer;
}

void draw()
{
  background(150);
  //update
  if (timer <= 0)
    gameState = GAME_OVER;

  if (gameState == RUNNING)
    timer -= 0.1f;

  if (gameState == GAME_OVER)
  {
    timer = 0;
    panel.deleteCells();
  }
  //display
  panel.display();
  fill(color(360, 100, 100));
  textSize(30);
  lv = new String("Lv:") + panel.level;
  text(lv, 550, 120, 580, 150);
  time = new String("Time:") + timer;
  text(time, 150, 120, 180, 150);

  if (gameState == GAME_OVER)
  {
    fill(color(360,100,100));
    textSize(100);
    text("GAME OVER",200,500);
  }
}

void mouseClicked()
{
  if(panel.clicked(mouseX,mouseY))
  {
    panel.updateLevel();
    panel.updateRowNumber();
    panel.updateDifficulty();
    panel.deleteCells();
    panel.initialize();
    timer = 15.0f;
  }
  else
  {
    gameState = GAME_OVER;
    println("GAME OVER");
  }
}