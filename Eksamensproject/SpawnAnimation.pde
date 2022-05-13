class SpawnAnimation {

  float n;
  int decay;
  PVector location;
  int enemyType;

  SpawnAnimation(PVector loc, int type) {
    location = loc;
    n = 0.05;
    decay = 125;
    enemyType = type;
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
      enemies.add(new Enemy(sa.enemyType, new PVector(sa.location.x, sa.location.y)));

      for (Enemy e : enemies) {
        switch(e.enemyType) {

        case 1:
          e.eLife = 8;
          e.maxLife = 8;
          break;

        case 2:
          e.eLife = 15;
          e.maxLife = 15;
          break;

        case 3:
          e.eLife = 15;
          e.maxLife = 15;
          break;

        case 4:
          e.eLife = 20;
          e.maxLife = 20;
          break;
        }
      }
    }
  }
}
