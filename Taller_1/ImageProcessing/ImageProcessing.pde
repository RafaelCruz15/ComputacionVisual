PGraphics pg,pg1,pg2,pg3;
PImage photo;
int init, end;
int histMax;
int bright;
int[] hist = new int[256];
int click;
int option = 1;




void setup() {
  size(820, 1280);
  photo = loadImage("Est.jpg");
  photo.resize(400,215);
  pg = createGraphics(photo.width, photo.height);
  pg1 = createGraphics(photo.width, photo.height);
  pg2 = createGraphics(photo.width, photo.height);
  pg3 = createGraphics(photo.width, photo.height);

  
}

void draw() {
  
  rgb_average(pg,photo);
  luma(pg1,photo);
  blur(pg2,photo,option);

  
  image(photo, 10, 15);
  image(pg,10,230);
  image(pg1,10,445);
  image(pg2,410,15);
  
  for (int i = 0; i < pg1.width; i++) {
    for (int j = 0; j < pg1.height; j++) {
      bright = int(brightness(get(i, j)));
      hist[bright]++; 
    }
  }
  
  histMax = max(hist);
  
  stroke(255);
  for (int i = 0; i < pg1.width; i += 2) {
    int which = int(map(i, 0, pg1.width, 0, 255));
    int y = int(map(hist[which], 0, histMax, pg1.height, 0));
    line(i + 15, pg1.height + 444, i + 15, y + 444);
  }
  

}


void drawImage(){
  
  pg3.beginDraw();
  pg3.clear();
  background(204);
  pg3.loadPixels();
  pg1.loadPixels();
  
  int len = hist.length;
  int dimension = pg1.width * pg1.height;
  
  for(int i = 0;i<dimension;i++){

    if (init > end){
      int auxpos = init;
      init = end;
      end = auxpos;
    }
    
    int bright = int(brightness(pg1.pixels[i]));
    for(int j = init;j<end;j++){
      if(bright == j){   
        pg3.pixels[i] = pg1.pixels[i];    
      }
    }
  }
  
  pg3.updatePixels();
  pg3.endDraw();
  image(pg3,410,445);

}

void mousePressed()
{
  if (click == 1) {    
    click = 2;
    end = int(map(mouseX, 0, pg1.width, 0,255));
    drawImage();
  }
  else {
    click = 1;
    init = int(map(mouseX, 0, pg1.width, 0,255 ));
  }
}

void keyPressed(){

  if(key == ENTER){
    option = (option + 1) % 4;
  }
  

}
