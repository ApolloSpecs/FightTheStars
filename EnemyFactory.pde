PImage[] bomb = new PImage[3];
PImage[] shoot = new PImage[4];

class EnemyFactory {
  ArrayList<Vehicle> vC;
  color red = color(255, 0, 0);
  color blue = color(44, 85, 165);

  EnemyFactory() {
    vC = new ArrayList<Vehicle>();
    /////////////////////////////////
    bomb[0] = loadImage("bombFrameOne.png");
    bomb[1] = loadImage("bombFrameTwo.png");
    bomb[2] = loadImage("bombFrameThree.png");
    //////////////////////////////////////////
    shoot[0] = loadImage("shootFrameOne.png");
    shoot[1] = loadImage("shootFrameTwo.png");
    shoot[2] = loadImage("shootFrameThree.png");
    shoot[3] = loadImage("shootFrameFour.png");
    ///////////////////////////////////////////
  }

  void addBomb(float speed, float turnSpeed) {
    vC.add(new Vehicle( new PVector(random(width), random(height)), speed, turnSpeed, bomb[0]));
  }
  void addShoot(float speed, float turnSpeed) {
    vC.add(new Vehicle( new PVector(random(width), random(height)), speed, turnSpeed, shoot[0]));
  }


  // include shield mode
  void SelfHit() {
    for (int i = vC.size()-1; i >= 0; i--) {
      Vehicle v = vC.get(i);
      color crashX = v.selfContactX(); 
      color crashY = v.selfContactY();
      color crashUP = v.selfContactUP();
      color crashDOWN = v.selfContactDOWN();
      if (crashX==red||crashX==blue) {
        vC.remove(i);
      } else if (crashY==red||crashY==blue) {
        vC.remove(i);
      } else if (crashUP==red||crashUP==blue) {
        vC.remove(i);
      } else if (crashDOWN==red||crashDOWN==blue) {
        vC.remove(i);
      }
    }
  }

  void hunt() {
    for (int i = vC.size()-1; i >= 0; i--) {
      Vehicle v = vC.get(i);
      v.run(mouse);
      if (v.isDead()) {
        vC.remove(i);
      }
      if (v.contact(mouse)) {
        vC.remove(i);
        //health-=1;
        //shipOff+=1;
      }
    }
  }
}
