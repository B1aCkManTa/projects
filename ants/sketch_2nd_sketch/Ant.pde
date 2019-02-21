class Ant{
  float x,y;
  PVector speed;
  PImage img;
  Ant(){
    x=random(16,500-16);
    y=random(16,500-16);
    speed=new PVector(random(-1,1),random(-1,1));
    img = loadImage("ant_PNG33.png");
  }
  
  void drawAnt(){
    moveAnt();
    fill(255,0,0);
    pushMatrix();
    translate(x + img.width/2, y +img.height/2);
    rotate(speed.heading()+PI/2);
    translate(-img.width/2,-img.height/2);
    image(img,0,0);
    popMatrix();
  }
  
  void moveAnt(){
    float r=random(0,1);
    if(r<0.1){
      speed.rotate(random(-0.3,0.3));
    }
    if(r>0.97){
      speed.rotate(random(-1,1));
    }
    x=x+speed.x;
    y=y+speed.y;
    if(offScreen()){
      x=x-speed.x;
      y=y-speed.y;
      speed.rotate(random(-2,2));
    }
  }
  
  boolean offScreen(){
    if(x<10 || x>width-10 || y<10 || y>height-10){
      return true;
    }
    return false;
  }
}