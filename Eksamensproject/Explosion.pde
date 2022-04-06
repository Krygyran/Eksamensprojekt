class Explosion {

  float n;
  int decay;
  int spread;
  PVector location;

  Explosion(PVector loc) {
    location = loc;
    n = 0.05;
    decay = 40;
    spread = 0;
  }

  void display() {
    antal_p = 15;
    c = color(255, random(60, 180), 0, round(2.55*decay));
    for (int i = 0; i < 5; i++) {
      systems.add(new ParticleSystem(location.x+random(-spread, spread), location.y+random(-spread, spread)));
    }
    spread=spread+4;
  }
}

void clearEX(){
 for (int i =explosions.size()-1; i >= 0; i--) {
    Explosion ex = explosions.get(i);
    if (ex.decay < 1) {
      explosions.remove(ex);
    }
  }
}
