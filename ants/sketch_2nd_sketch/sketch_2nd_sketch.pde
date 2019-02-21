ArrayList <Ant> ants =new ArrayList<Ant>();
int numAnts=50;
int speed=2;
boolean[]keys=new boolean[128];
player p;
spray spray;
float SprayerX;
float SprayerY;
boolean hasSprayer;
void setup(){
  hasSprayer=false;
  SprayerX=random(15,width-15);
  SprayerY=random(15,height-15);
  spray=new spray(-100,-100);
  p=new player();
  size(700,700);
  frameRate(60);
  for(int i=0;i<numAnts;i++){
    ants.add(new Ant());
  }
}
void draw(){
  background(0,255,0);
  fill(255,0,0);
  foundSpray(SprayerX,SprayerY);
  if(!hasSprayer){
  ellipse(SprayerX,SprayerY,10,10);
  }
  if(hasSprayer){
      text("kill" ,0,15);
    }
  for(int i=0;i<numAnts;i++){
    ants.get(i).drawAnt();
  }
   move();
  p.drawPlayer();
  
}
void move(){
  int xDelta=0;
  int yDelta=0;
  if(keys['a'])//a
  xDelta-=speed;
  if(keys['d'])//d
  xDelta+=speed;
  if(keys['w'])//w
  yDelta-=speed;
  if(keys['s'])//s
  yDelta+=speed;
  if(keys[' '])
  spray=new spray(p.getx(),p.gety());
  p.updatePlayer(xDelta,yDelta);
}

void keyPressed(){
  keys[key]=true;
}

void keyReleased(){
  keys[key]=false;
}
 void foundSpray(float Sx,float Sy){
    float d=sqrt((p.getx()+15-Sx)*(p.getx()+15-Sx)+(p.gety()+18-Sy)*(p.gety()+18-Sy));
    if(d<=15){
      hasSprayer=true;
    }
  }