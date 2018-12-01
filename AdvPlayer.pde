float health = 150;
float startingHealth = health;
boolean goingDown;
float shipOff = 20;

PImage[] ship = new PImage[2];
PVector mouse;     // ship's mouseition
class AdvPlayer {

  PVector speed;   // ship's speed
  PVector accel;   // ship's acceleration
  float direction; // ship's direction

  AdvPlayer() {
    for (int i = 0; i < ship.length; i++) {
      ship[i] = loadImage("shipFrameOne.png");
    }
    mouse = new PVector(width/2, height/2, 0);
    speed = new PVector();
    accel = new PVector();
  }
  void drawPlayer() {
    checkKeys();

    speed.add(accel);  
    mouse.add(speed);   
    drawShip();
    accel.set(0, 0, 0);                     
    if (speed.mag() != 0) speed.mult(0.99); 
    if (mouse.x<0) {
      mouse.x = mouse.x+width;
    }
    if (mouse.x>width) {
      mouse.x = 0;
    }
    if (mouse.y<0) {
      mouse.y = mouse.y+height;
    }
    if (mouse.y>height) {
      mouse.y = 0;
    }
  }

  void checkKeys() {
    if (keyPressed && key == CODED) {
      if (keyCode == LEFT) {
        direction-=0.1;
      } else if (keyCode == RIGHT) {
        direction+=0.1;
      } else if (keyCode == UP) {
        goingDown = false;
        float totalAccel = 0.2;                 
        accel.x = totalAccel * sin(direction);  
        accel.y = -totalAccel * cos(direction);
      } else if (keyCode == DOWN) {
        goingDown = true;
        float totalAccel = 0.2;                 
        accel.x = -totalAccel * sin(direction);  
        accel.y = totalAccel * cos(direction);
      }
    }
  }

  void drawShip() {
    pushMatrix();
    translate(mouse.x, mouse.y);
    rotate(direction);
    //actually draws the image right here
    imageMode(CENTER);
    image(ship[0], 0, 0, health-shipOff, health-shipOff);
    if (accel.mag() != 0&& goingDown == false) {
      float thrusterCol = random(75, 255);
      fill(thrusterCol, thrusterCol/2, 0);
      triangle(-5, 22, 5, 22, 0, 40);
    } else if (accel.mag() != 0&& goingDown == true) {
      float thrusterCol = random(75, 255);
      int x = 250;
      int y = 255;
      fill(thrusterCol, thrusterCol/2, 0);
      triangle(208-x, 230-y, 214-x, 230-y, 211-x, 215-y);
      triangle(285-x, 230-y, 291-x, 230-y, 288-x, 215-y);
    }
    popMatrix();
  }
}
