import processing.pdf.*;


PVector pos;
PVector dir;
float startTime = 0;
float vel = 100; 

SpaceShip spaceShip;

void setup() {
  size(1024, 768);
  startTime = millis();
  pos = new PVector(100, 400);
  dir = new PVector(0, 0);
}

void draw() {
  float elapsedTime = (millis() - startTime)/1000.0f;
  startTime = millis();
  
  clear();
  update(elapsedTime);
  //circle(pos.x, pos.y, 50);
  
  
  beginRecord(PDF, "7_zoog_spaceship_exercise.pdf"); 

  
  desenhaNave(pos.x, pos.y, 223);

  
  save("7_zoog_spaceship_exercise.jpg");
  endRecord();
}

void update(float elapsedTime) {
  // Movimento de perseguição
  PVector m = PVector.mult(dir, vel * elapsedTime);
  //PVector m = PVector.mult(PVector.mult(dir, -1), vel * elapsedTime);
  // Direção invertida, movimento de fuga
  pos.add(m);
  float d = dist(pos.x, pos.y, mouseX, mouseY);
  if (d < 20) {
    dir.set(0, 0);
  }
}

void mouseMoved() {
  PVector mouse = new PVector(mouseX, mouseY);
  dir = PVector.sub(mouse, pos).normalize();
}


void desenhaNave(float x, float y, float w) {
  fill(50);
  noStroke();
  ellipse(x, y, w, w/3);
  ellipse(x, y-w/8, w/3, w/3);

  float diam = w * 0.125;
  for (float windowX = x-diam*2; windowX <= x+diam*2; windowX += diam*2) {
    fill(255);
    ellipse(windowX, y, diam, diam);
  }
}
