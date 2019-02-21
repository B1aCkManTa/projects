int speed=5;
boolean[]keyCodes=new boolean[128];
ArrayList<bullet> bullets=new ArrayList<bullet>();
ArrayList<enemy> enemies=new ArrayList<enemy>();
player p;
PImage backG;
int lvl=1;
void setup() {
  imageMode(CENTER);
  p=new player();
  size(800, 800);
  backG=loadImage("chicken invaders 5.jpg");
  addEnemies();
}

void draw() {
  textSize(32);
  move();
  image(backG, width/2, height/2);
  fill(0, 255, 0);
  text("Lives Left :"+p.life,0,height);
  fill(255, 0, 0);
  text("Level :"+lvl,10,30);
  if(enemies.size()==0){
    lvl++;
    p.life+=1;
    addEnemies();
  }
  if(!isDead()){
    for(int i=0;i<enemies.size();i++)
    enemies.get(i).move();
    checkContact();
    p.show();
    showEnemies();
    bulletCheck();
    drawBullets();
  }
  else{
   text("GAME OVER",width/2.6,height/2); 
  }
}

void bulletCheck(){
  for(int i=0;i<bullets.size();){
    float tmp=bullets.get(i).pos.y;
    if(tmp<=0 || tmp>= height)
    bullets.remove(i);
    else
    i++;
  }
}

void move() {
  if (keyCodes['A'] || keyCodes[LEFT])
    p.moveLeft();
  if (keyCodes['D'] || keyCodes[RIGHT])
    p.moveRight();
  if (keyCodes['W'] || keyCodes[UP])
    p.moveUp();
  if (keyCodes['S'] || keyCodes[DOWN])
    p.moveDown();
  if (p.timer==0)
    friendlyFire();
}

void keyPressed() {
  if (keyCode=='A' || keyCode=='D' || keyCode=='W' || keyCode=='S' ||keyCode==UP||keyCode==DOWN||keyCode==LEFT||keyCode==RIGHT)
    keyCodes[keyCode]=true;
}

void keyReleased() {
  if (keyCode=='A' || keyCode=='D' || keyCode=='W' || keyCode=='S' ||keyCode==UP||keyCode==DOWN||keyCode==LEFT||keyCode==RIGHT)
    keyCodes[keyCode]=false;
}

void friendlyFire()
{
  p.timer++;
  bullets.add(new bullet(p.pos.x, p.pos.y, true ));
}
void enemyFire(enemy e) 
{
  bullets.add(new bullet(e.pos.x, e.pos.y, false));
}

void showEnemies()
{
  for (int i=0; i<enemies.size(); i++)
  {
    if (enemies.get(i).life==0)
    {
      enemies.remove(i);
      i--;
      continue;
    }
    if (random(1)<0.05 && enemies.get(i).timer==0)
    {
      enemyFire(enemies.get(i));
      enemies.get(i).timer++;
    }
    enemies.get(i).show();
  }
}

void drawBullets() {
  bulletsCollide();
  for (int i=0; i<bullets.size(); i++) 
  {
    if (bulletHit(bullets.get(i)))
    {
      bullets.remove(i);
      i--;
      continue;
    }
    bullets.get(i).moveBullet();
    bullets.get(i).drawBullet();
    if (bullets.get(i).pos.y+bullets.get(i).img.height/2<0)
    {
      bullets.remove(i);
      i--;
    }
  }
}
void bulletsCollide()
{
  for (int i=0; i<bullets.size(); i++)
  {
    for (int j=0; j<bullets.size(); j++)
    {
      if (i!=j && i>=0 && j>=0 && PVector.dist(bullets.get(i).pos, bullets.get(j).pos)<=bullets.get(i).img.width/2)
      {
        if (i>j)
        {
          bullets.remove(i);
          bullets.remove(j);
          i--;
          j--;
        } else
        {
          bullets.remove(j);
          bullets.remove(i);
          i--;
          j--;
        }
      }
    }
  }
}
boolean bulletHit(bullet shot)
{ 
  if (shot.isFriendly)
  {
    for (int i=0; i<enemies.size(); i++)
    {
      if (PVector.dist(enemies.get(i).pos, shot.pos)<=shot.img.width/2)
      { 
        enemies.get(i).life--;
        return true;
      }
    }
  } 
  else
  {
    if (PVector.dist(shot.pos, p.pos) <= shot.img.width/2)
    { 
      p.life--;
      return true;
    }
  }
  return false;
}
void checkContact()
{
  for (int i=0; i<enemies.size(); i++)
  {
    if (PVector.dist(enemies.get(i).pos, p.pos)<p.img.width/2)
    {
      enemies.get(i).life--;
      p.life--;
    }
  }
}

boolean isDead(){
  if(p.life==0)
  return true;
  return false;
}

void addEnemies(){
   for(int i=0;i<lvl;i++)
  enemies.add(new enemy(1));
}

void shipCollide(){
  
}