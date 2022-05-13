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
    if (artifactType == 1) {
      antal_p = 15;
      c = color(random(120,167), 209, 90, round(6.375*decay));
    } 

    if (artifactType == 3) {
      antal_p = 15;
      c = color(0, random(100, 160), 185, round(6.375*decay));
    } 
    
    if(artifactType != 1 && artifactType != 3) {
      antal_p = 15;
      c = color(255, random(60, 180), 0, round(6.375*decay));
    }


    for (int i = 0; i < 5; i++) {
      systems.add(new ParticleSystem(location.x+random(-spread, spread), location.y+random(-spread, spread)));
    }
    spread=spread+4;
  }
}

void clearEX() {
  for (int i =explosions.size()-1; i >= 0; i--) {
    Explosion ex = explosions.get(i);
    if (ex.decay < 1) {
      explosions.remove(ex);
    }
  }
}
