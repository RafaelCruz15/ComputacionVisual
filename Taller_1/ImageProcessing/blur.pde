float v = 1.0 / 9.0;
float[][] kernel;



void blur(PGraphics pg,PImage photo, int option){

  switch (option){
  
    case 1:
      kernel = new float[][] {{ v, v, v }, { v, v, v }, { v, v, v }};
    break;
    
    case 2:
      kernel = new float[][] {{ 0, 1, 0}, { 1, -4, 1 }, { 0, 1, 0 }};
    break;
    
    case 3:
      kernel = new float[][] {{ 0, -1, 0 }, { -1, 5, -1 }, { 0, -1, 0 }};
    break;
    
    case 4:
      kernel = new float[][] {{ 0, 0, 0 }, { 0, 1, 0 }, { 0, 0, 0 }};
    break;
  
  
  }
  
  
  
  pg.beginDraw();
  pg.loadPixels();
  photo.loadPixels();
  
  
  
  
  
   for (int y = 1; y < photo.height-1; y++) {   // Skip top and bottom edges
    for (int x = 1; x < photo.width-1; x++) {  // Skip left and right edges
      float red = 0; // Kernel sum for this pixel
      float blue = 0;
      float green = 0;
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          // Calculate the adjacent pixel for this kernel point
          int pos = (y + ky)*photo.width + (x + kx);
          // Image is grayscale, red/green/blue are identical
          float r = red(photo.pixels[pos]);
          float g = green(photo.pixels[pos]);
          float b = blue(photo.pixels[pos]);
          // Multiply adjacent pixels based on the kernel values
          red += kernel[ky+1][kx+1] * r;
          blue += kernel[ky+1][kx+1] * b;
          green += kernel[ky+1][kx+1] * g;
        }
      }
      // For this pixel in the new image, set the gray value
      // based on the sum from the kernel
      pg.pixels[y*photo.width + x] = color(red,green,blue);
    }
  }
  pg.updatePixels();   
  pg.endDraw();
  
}
