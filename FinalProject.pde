AdvPlayer P;
EnemyFactory Nemisis;
float DIF = 1;
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
  apply();
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

//void mousePressed() {
//  Nemisis.addBomb(0.1, 11);
//  Nemisis.addShoot(0.1, 11);
//}
