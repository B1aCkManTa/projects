class spray{
  float x,y;
  float currDur;
  float maxDur;
  
  spray(float x,float y){
    this.x=x;
    this.y=y;
    maxDur=100;
    currDur=1;
  }
  
  void drawSpray(){
    if(currDur<maxDur){
    float alphaVal=currDur/maxDur * 150;
    noStroke();
    fill(0,0,255,150-alphaVal);
    ellipse(x,y,40-currDur/5,40-currDur/5);
    currDur++;
    }
  }
  
}