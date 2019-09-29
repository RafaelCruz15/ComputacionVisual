float v = 1.0 / 9.0;
float[][] kernel;

//Aplicación de Mascaras tomado del API de processing https://processing.org/examples/blur.html

void maskConv(PGraphics pg,PImage mS, int option){

  switch (option){
  
    case 1:
      kernel = new float[][] {{ v, v, v }, { v, v, v }, { v, v, v }};
      println("mask op1: ", frameRate);
    break;
    
    case 2:
      kernel = new float[][] {{ 0, 1, 0}, { 1, -4, 1 }, { 0, 1, 0 }};
      println("mask op2: ", frameRate);
    break;
    
    case 3:
      kernel = new float[][] {{ 0, -1, 0 }, { -1, 5, -1 }, { 0, -1, 0 }};
      println("mask op3: ", frameRate);
    break;
    
    case 4:
      kernel = new float[][] {{ 0, 0, 0 }, { 0, 1, 0 }, { 0, 0, 0 }};
      println("mask op4: ", frameRate);
    break;
  
  
  }
  
  pg.beginDraw();
  pg.loadPixels();
  mS.loadPixels();
  
   for (int y = 1; y < mS.height-1; y++) {  
    for (int x = 1; x < mS.width-1; x++) {  
      float red = 0; 
      float blue = 0;
      float green = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*mS.width + (x + kx);
          float r = red(mS.pixels[pos]);
          float g = green(mS.pixels[pos]);
          float b = blue(mS.pixels[pos]);
          red += kernel[ky+1][kx+1] * r;
          blue += kernel[ky+1][kx+1] * b;
          green += kernel[ky+1][kx+1] * g;
        }
      }
      pg.pixels[y*mS.width + x] = color(red,green,blue);
    }
  }
  pg.updatePixels();   
  pg.endDraw();
  
}
