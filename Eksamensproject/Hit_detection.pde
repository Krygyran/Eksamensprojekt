boolean heal;

//Kollision mellem fjender og bullets////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void detect2() {
  for (int i =balls.size()-1; i >= 0; i--) {
    Ball b = balls.get(i);
    for (int j =enemies.size()-1; j >= 0; j--) {
      Enemy e = enemies.get(j);
      float l2 = dist(b.location.x, b.location.y, e.location.x, e.location.y);

      if (l2 < 50 ) {
        e.vel.add(new PVector(b.velocity.x, b.velocity.y).mult(knockBack));
        e.eLife -= (damage);
        b.life -= 1;
        e.hit = true;
        antal_p=30;
        c = color(209, 46, 46);
        systems.add(new ParticleSystem(e.location.x, e.location.y));

        if (weaponType == 5) {
          explosions.add(new Explosion(b.location));
          translate(5, 5);
          translate(-5, -5);
          translate(5, -5);
          translate(0, 0);
        }
      }
      if (e.eLife <= 0) {
        enemies.remove(e);
        coins.add(new Coin(e.location));
        score=score+(50*combo);
        combo++;
        scoreHit=200;
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

        if (e.execute == true) {
          enemies.remove(e);
          coins.add(new Coin(e.location));
          e.execute = false;
          score=score+(100*combo);
          combo++;
          scoreHit=200;

          if (meleeType==2) {
            reset = true;
          }
        }
      }
      if (s.life < 1) {
        swords.remove(s);
      }
    }
  }
}

void detect4() {
  for (int i =explosions.size()-1; i >= 0; i--) {
    Explosion ex = explosions.get(i);
    for (int j =enemies.size()-1; j >= 0; j--) {
      Enemy e = enemies.get(j);
      float l2 = dist(ex.location.x, ex.location.y, e.location.x, e.location.y);

      if (l2 < 100 ) {
        e.eLife -= 0.05;
        e.hit = true;
        antal_p=30;
      
        c = color(209, 46, 46);
        systems.add(new ParticleSystem(e.location.x, e.location.y));
      }
      if (e.eLife <= 0) {
        enemies.remove(e);
          score=score+(25*combo);
          combo++;
          scoreHit=200;
      }
    }
  }
}


//Kollision mellem fjender og spillet////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void detect5() {
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


void detect6() {
  for (Enemy e : enemies) {
    float l = dist(p.pos.x, p.pos.y, e.location.x, e.location.y);
    if (l < 35 && canHit >= 60) {
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

void detect7() {
  float l1 = dist(bo.location.x, bo.location.y, p.pos.x, p.pos.y);

  if (l1 < 75 && canHit >= 60) {
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


  for (Ball b : balls) {
    float l2 = dist(bo.location.x, bo.location.y, b.location.x, b.location.y);
    if (l2 < 75) {
      bo.blife -= (damage);
      b.life -= 1;
      bo.hit = true;
      antal_p=30;
      c = color(209, 46, 46);
      systems.add(new ParticleSystem(bo.location.x, bo.location.y));

      if (weaponType == 5) {
        explosions.add(new Explosion(b.location));
        translate(5, 5);
        translate(-5, -5);
        translate(5, -5);
        translate(0, 0);
      }
    }
  }
}

void detect8() {
  for (Sword s : swords) {
    float l2 = dist(bo.location.x, bo.location.y, s.location.x, s.location.y);
    if (l2 < 100) {
      bo.blife -= (mDamage);
      s.life -= 1;
      bo.hit = true;
      antal_p=30;
      c = color(209, 46, 46);
      systems.add(new ParticleSystem(bo.location.x, bo.location.y));
    }
  }
}

void detect9() {
  for (Explosion ex : explosions) {
    float l2 = dist(bo.location.x, bo.location.y, ex.location.x, ex.location.y);
    if (l2 < 100) {
      bo.blife -= 0.05;
      bo.hit = true;
      antal_p=30;
      c = color(209, 46, 46);
      systems.add(new ParticleSystem(bo.location.x, bo.location.y));
    }
  }
}


void detectArtifact() {
  for (int i =artis.size()-1; i >= 0; i--) {
    Artifact a = artis.get(i);

    float l = dist(p.pos.x, p.pos.y, a.location.x, a.location.y);

  if (l < 50 && a.itemType == 1) {
      artifactType = 1;
    }

    if (l < 50 && a.itemType == 2) {
      artifactType = 2;
    }

    if (l < 50 && a.itemType == 3) {
      artifactType = 3;
    }
  }
}
