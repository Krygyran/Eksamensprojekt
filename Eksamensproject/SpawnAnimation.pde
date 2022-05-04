class SpawnAnimation {

  float n;
  int decay;
  PVector location;

  SpawnAnimation(PVector loc) {
    location = loc;
    n = 0.05;
    decay = 125;
  }

  void display() {
    antal_p = 15;
    c = color(255, 0, 50);
    for (int i = 0; i < 5; i++) {
      systems.add(new ParticleSystem(location.x, location.y));
    }
  }
}

void clearAnimation() {
  for (int i =animations.size()-1; i >= 0; i--) {
    SpawnAnimation sa = animations.get(i);
    if (sa.decay < 1) {
      animations.remove(sa);
      enemies.add(new Enemy(round(random(1, 4)), new PVector(sa.location.x, sa.location.y)));

      for (Enemy e : enemies) {
        switch(e.enemyType) {

        case 1:
          e.eLife = 8;

          break;

        case 2:
          e.eLife = 15;
          break;

        case 3:
          e.eLife = 20;
          break;

        case 4:
          e.eLife = 20;
          break;
        }
      }
    }
  }
}
