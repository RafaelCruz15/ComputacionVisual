import processing.video.*;
 
Movie m;
PImage mS;
int vScale = 4;
int mW;
int mH;
PGraphics pg;
int click = 1;
int option = 1;
 
boolean gotDim = false;
 
void setup() {
  size(800, 480);
  m = new Movie(this, "J. Cole - Everybody Dies.mp4"); 
  m.loop();
}
 
void draw() {  
  if (!gotDim) {
    if (mW == 0 && mH == 0) {
      mW = m.width; 
      mH = m.height;
    } else if (mW > 0 && mH > 0) {
      gotDim = true;
      println("width: " + mW +" " + "Height: " + mH);
    }
  }
 
  if (gotDim) {
    mS = m.get(); 
    mS.resize(mW/vScale, mH/vScale); 
    pg = createGraphics(mS.width, mS.height);

    image(mS, 0, 15);
    rgb_average(pg,mS);
    image(pg,360,15);
    luma(pg,mS);
    image(pg,0,200);
    maskConv(pg,mS,option);
    image(pg,360,200);
    
    
  }
}
 
void movieEvent(Movie m) {
  m.read();
}


void mousePressed()
{
  
  click = click + 1;
  if(click > 4){
    click = 1;
  }
  
  option = click;
  
}
