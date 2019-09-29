import processing.video.*;
 
Movie m;
PImage mS;
int vScale = 4;
int mW;
int mH;
PGraphics pg;

 
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
    rgb_average(pg,mS);
    luma(pg,mS);

    image(mS, 0, 15);
    image(pg,360,15);
    
    
  }
}
 
void movieEvent(Movie m) {
  m.read();
}
