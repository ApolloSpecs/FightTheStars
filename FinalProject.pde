AdvPlayer P;
EnemyFactory Nemisis;
float DIF = 0.75;
byte lifeX = 100;
void setup() {
  fullScreen();
  //size(500, 500);
  P = new AdvPlayer();

  Nemisis = new EnemyFactory();
}
void draw() {
  background(255);
  P.drawPlayer();
  Nemisis.hunt();
  Nemisis.SelfHit();
  // apply();
  // for debugging purposes click to reveal enemys
  strokeWeight(3);
  stroke(0);
  if (lifeX >= 50) {
    fill(0, 255, 0);
  } else if (lifeX >=25 && lifeX <=50) {
    fill(255, 127, 80);
  } else if (lifeX < 25) {
    fill(255, 0, 0);
  }
  rect(50, 50, lifeX, 10);
  noFill();
  rect(50, 50, 100, 10);
}
void apply() {
  float random = random(0, 100);
  if (random<DIF) {
    Nemisis.addBomb(10, 0.030);
    Nemisis.addBomb(15, 0.30);
    Nemisis.addShoot(5, 0.10);
    Nemisis.addShoot(7, 0.15);
  }
  if (DIF<5) {
    DIF+=0.0003;
  }
}

void mousePressed() {
  Nemisis.addBomb(0.1, 11);
  Nemisis.addShoot(0.1, 11);
}
