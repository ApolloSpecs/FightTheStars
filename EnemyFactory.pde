PImage[] bomb = new PImage[3];
PImage[] shoot = new PImage[4];

class EnemyFactory {
  ArrayList<Vehicle> vC;
  color lr = color(255, 0, 0);
  color dr = color(172, 0, 0);
  color r = color(255, 7, 7);

  color lb = color(53, 99, 189);
  color db = color(38, 72, 139);
  color b = color(44, 85, 165);

  color g = color(0);

  color taboo[] = {lr, dr, r, lb, db, b, g};

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
    vC.add(new Vehicle( new PVector(random(width), random(height)), speed, turnSpeed, bomb));
  }
  void addShoot(float speed, float turnSpeed) {
    vC.add(new Vehicle( new PVector(random(width), random(height)), speed, turnSpeed, shoot));
  }


  // include shield mode
  void SelfHit() {
    for (int i = vC.size()-1; i >= 0; i--) {
      Vehicle v = vC.get(i);
      int off = 27;
      color crashX = v.selfContactX(off); 
      color crashY = v.selfContactY(off);
      color crashUP = v.selfContactUP(off);
      color crashDOWN = v.selfContactDOWN(off);
      for (int j = 0; j < taboo.length; j++) {
        if (crashX==taboo[j]) {
          vC.remove(i);
        } else if (crashY==taboo[j]) {
          vC.remove(i);
        } else if (crashUP==taboo[j]) {
          vC.remove(i);
        } else if (crashDOWN==taboo[j]) {
          vC.remove(i);
        }
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
