import nub.primitives.*;
import nub.core.*;
import nub.processing.*;

// 1. Nub objects
Scene scene;
Node node;
Vector v1, v2, v3;
// timing
TimingTask spinningTask;
boolean yDirection;
// scaling is a power of 2
int n = 4;


//--------------------------NUEVO----------------------------------//
// triangle's vertices color
color[] c = {color(0, 0, 255), color(255, 0, 0), color(0, 255, 0)};
int sft = 100;
//--------------------------NUEVO----------------------------------//


// 2. Hints
boolean triangleHint = true;
boolean gridHint = true;
boolean debug = true;
boolean shadeHint = false;

//--------------------------NUEVO----------------------------------//
boolean antialiasing = false;
boolean depthMap = true;
//--------------------------NUEVO----------------------------------//

// 3. Use FX2D, JAVA2D, P2D or P3D
String renderer = P2D;

// 4. Window dimension
int dim = 10;

void settings() {
  size(int(pow(2, dim)), int(pow(2, dim)), renderer);
}

void setup() {
  rectMode(CENTER);
  scene = new Scene(this);
  if (scene.is3D())
    scene.setType(Scene.Type.ORTHOGRAPHIC);
  scene.setRadius(width/2);
  scene.fit(1);

  // not really needed here but create a spinning task
  // just to illustrate some nub timing features. For
  // example, to see how 3D spinning from the horizon
  // (no bias from above nor from below) induces movement
  // on the node instance (the one used to represent
  // onscreen pixels): upwards or backwards (or to the left
  // vs to the right)?
  // Press ' ' to play it
  // Press 'y' to change the spinning axes defined in the
  // world system.
  spinningTask = new TimingTask(scene) {
    @Override
    public void execute() {
      scene.eye().orbit(scene.is2D() ? new Vector(0, 0, 1) :
        yDirection ? new Vector(0, 1, 0) : new Vector(1, 0, 0), PI / 100);
    }
  };

  node = new Node();
  node.setScaling(width/pow(2, n));

  // init the triangle that's gonna be rasterized
  randomizeTriangle();
}

void draw() {
  background(0);
  stroke(0, 255, 0);
  if (gridHint)
    scene.drawGrid(scene.radius(), (int)pow(2, n));
  if (triangleHint)
    drawTriangleHint();
  push();
  scene.applyTransformation(node);
  triangleRaster();
  pop();
}


//--------------------------NUEVO----------------------------------//

// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() {
  int limCoord = floor(pow(2, n)/2);
  boolean repeat = true;
  for (int i = - limCoord; i < limCoord; i++) {
    for (int j = - limCoord; j < limCoord; j++) {
      pushStyle();
      Vector p = node.worldLocation(new Vector(i + 0.5f, j + 0.5f));
      if (belongsToArea(p, false)) {
        drawPoint(i, j);
        repeat = false;
        if (antialiasing) {
          Vector[] n = neighbors(i, j);
          for (int k = 0; k < 8; k++) {
            if (belongsToArea(n[k], true)) {
              int[] po = positions(k);
              drawPoint(i + po[0], j + po[1]);
            }
          }
        }
      }
      popStyle();
    }
    if (i == limCoord - 1 && repeat) {
      Vector v = v1;
      v1 = v2;
      v2 = v;
      i = -limCoord;
      repeat = false;
    }
  }
  
}

boolean belongsToArea(Vector p, boolean softMode) {
  boolean belongsTo;
  float w[] = new float[3];
  belongsTo = (w[0] = edge(p, v1, v2)) >= 0;
  belongsTo &= (belongsTo || softMode) ? (w[1] = edge(p, v2, v3)) >= 0 : false;
  belongsTo &= (belongsTo || softMode) ? (w[2] = edge(p, v3, v1)) >= 0 : false;
  if (belongsTo && !softMode || !belongsTo && softMode) {
    color c = interpolateRGB(w);
    if (depthMap)
      c = depthMap(p, c);
    if (softMode)
      c = color(c, sft);
    setColor(c);
    return true;
  }
  return false;
}

color interpolateRGB(float[] edge) {
  float r = 0, g = 0, b = 0, 
    area = edge(v1, v2, v3);
  for (int i = 0; i < 3; i++) {
    edge[i] /= area;
    r += edge[i] * red(c[i]);
    g += edge[i] * green(c[i]);
    b += edge[i] * blue(c[i]);
  }
  return color(r, g, b);
}

float distanceToEye(Vector p) {
  Vector eye = scene.eye().position();
  Vector point = scene.eye().location(p);
  float d = eye.distance(point);
  return norm(d, 2000, 0);
}

float edge(Vector p, Vector vi, Vector vj) {
  float px = node.location(p).x(), py = node.location(p).y(), 
    vix = node.location(vi).x(), viy = node.location(vi).y(), 
    vjx = node.location(vj).x(), vjy = node.location(vj).y();
  return (px - vix) * (vjy - viy) - (py - viy) * (vjx - vix);
}

color depthMap(Vector p, color c) {
  float normDistance = distanceToEye(p), 
    r = red(c) * normDistance, 
    g = green(c) * normDistance, 
    b = blue(c) * normDistance;
  return color(r, g, b);
}

/*void mouseClicked() {
  if (mouseButton == LEFT) {
    v1 = new Vector(mouseX-width/2, mouseY-height/2);
  } else if (mouseButton == RIGHT) {
    v2 = new Vector(mouseX-width/2, mouseY-height/2);
  } else {
    v3 = new Vector(mouseX-width/2, mouseY-height/2);
  }
}*/

Vector[] neighbors(int i, int j) {
  Vector[] n = new Vector[8];
  for (int k = 0; k < 8; k++) {
    int [] po = positions(k);
    n[k] = node.worldLocation(new Vector(i + po[0] + 0.5f, j + po[1] + 0.5f));
  }
  return n;
}

int[] positions(int i) {
  int [] po = new int[2];
  switch(i) {
  case 0:
    po[0] = -1;
    po[1] = -1;
    break;
  case 1:
    po[0] = 1;
    po[1] = 1;
    break;
  case 2:
    po[0] = -1;
    po[1] = 1;
    break;
  case 3:
    po[0] = 1;
    po[1] = -1;
    break;
  case 4:
    po[0] = 0;
    po[1] = -1;
    break;
  case 5:
    po[0] = -1;
    po[1] = 0;
    break;
  case 6:
    po[0] = 0;
    po[1] = 1;
    break;
  case 7:
    po[0] = 1;
    po[1] = 0;
    break;
  }
  return po;
}

void drawPoint(float x, float y) {
    noStroke();
    rect(x, y, 1, 1);

}

void setColor(color c) {
  stroke(c);
  fill(c);
}

//--------------------------NUEVO----------------------------------//




void randomizeTriangle() {
  int low = -width/2;
  int high = width/2;
  v1 = new Vector(random(low, high), random(low, high));
  v2 = new Vector(random(low, high), random(low, high));
  v3 = new Vector(random(low, high), random(low, high));
}

void drawTriangleHint() {
  push();

  if(shadeHint)
    noStroke();
  else {
    strokeWeight(2);
    noFill();
  }
  beginShape(TRIANGLES);
  if(shadeHint)
    fill(255, 0, 0);
  else
    stroke(255, 0, 0);
  vertex(v1.x(), v1.y());
  if(shadeHint)
    fill(0, 255, 0);
  else
    stroke(0, 255, 0);
  vertex(v2.x(), v2.y());
  if(shadeHint)
    fill(0, 0, 255);
  else
    stroke(0, 0, 255);
  vertex(v3.x(), v3.y());
  endShape();

  strokeWeight(5);
  stroke(255, 0, 0);
  point(v1.x(), v1.y());
  stroke(0, 255, 0);
  point(v2.x(), v2.y());
  stroke(0, 0, 255);
  point(v3.x(), v3.y());

  pop();
}

void keyPressed() {
  if (key == 'a')
    antialiasing = !antialiasing;
  if (key == 'g')
    gridHint = !gridHint;
  if (key == 't')
    triangleHint = !triangleHint;
  if (key == 's')
    shadeHint = !shadeHint;
  if (key == 'd')
    debug = !debug;
  if (key == '+') {
    n = n < 7 ? n+1 : 2;
    node.setScaling(width/pow( 2, n));
  }
  if (key == '-') {
    n = n >2 ? n-1 : 7;
    node.setScaling(width/pow( 2, n));
  }
  if (key == 'r')
    randomizeTriangle();
  if (key == ' ')
    if (spinningTask.isActive())
      spinningTask.stop();
    else
      spinningTask.run();
  if (key == 'y')
    yDirection = !yDirection;
}
