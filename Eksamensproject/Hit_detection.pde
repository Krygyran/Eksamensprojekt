boolean heal;

//Kollision mellem fjender og bullets////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void detect2() {
  for (int i =balls.size()-1; i >= 0; i--) {
    Ball b = balls.get(i);
    for (int j =enemies.size()-1; j >= 0; j--) {
      Enemy e = enemies.get(j);
      float l2 = dist(b.location.x, b.location.y, e.location.x, e.location.y);

      if (l2 < 50 ) {
        e.vel.add(b.velocity);
        e.eLife -= (damage);
        b.life -= 1;
        e.hit = true;
        antal_p=30;
        c = color(209, 46, 46);
        systems.add(new ParticleSystem(e.location.x, e.location.y));
      }
      if (e.eLife <= 0) {
        enemies.remove(e);
      }
      if (b.life < 1) {
        balls.remove(b);
      }
    }
  }
}


void detect3() {
  for (int i =swords.size()-1; i >= 0; i--) {
    Sword s = swords.get(i);
    for (int j =enemies.size()-1; j >= 0; j--) {
      Enemy e = enemies.get(j);
      float l2 = dist(s.location.x, s.location.y, e.location.x, e.location.y);

      if (l2 < 50 ) {
        heal = true;
        e.vel.add(s.velocity);
        e.eLife -= (mDamage);
        s.life -= 1;
        e.hit = true;
        antal_p=30;
        c = color(209, 46, 46);
        systems.add(new ParticleSystem(e.location.x, e.location.y));
      }
      if (e.eLife <= 0) {
        enemies.remove(e);
      }
      if (s.life < 1) {
        swords.remove(s);
      }
    }
  }
}


//Kollision mellem fjender og spillet////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void detect4() {
  for (Enemy_ball eb : eballs) {
    float l2 = dist(p.pos.x, p.pos.y, eb.location.x, eb.location.y);
    if (l2 < 20 && canHit >= 60) {
      lives--;
      canHit = 0;
      antal_p=30;
      c = color(209, 46, 46);
      systems.add(new ParticleSystem(p.pos.x, p.pos.y));

      //Giver et ryst i skærmen
      translate(0+random(10, 20), 0+random(20, 20));
      translate(0+random(-20, -20), 0+random(-20, -20));
      translate(0+random(20, 20), 0+random(20, 20));
      translate(0, 0);
    }
  }
}


void detect5() {
  for (Enemy e : enemies) {
    float l = dist(p.pos.x, p.pos.y, e.location.x, e.location.y);
    if (l < 30 && canHit >= 60) {
      lives--;
      canHit = 0;
      antal_p=30;
      c = color(209, 46, 46);
      systems.add(new ParticleSystem(p.pos.x, p.pos.y));

      //Giver et ryst i skærmen
      translate(0+random(10, 20), 0+random(20, 20));
      translate(0+random(-20, -20), 0+random(-20, -20));
      translate(0+random(20, 20), 0+random(20, 20));
      translate(0, 0);
    }
  }
}