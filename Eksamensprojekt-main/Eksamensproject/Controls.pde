boolean downPressed;
boolean upPressed;
boolean rightPressed;
boolean leftPressed;
boolean[] pressed = new boolean[256];
PVector spawnPos = new PVector();
boolean reset = false;
boolean dash;

void keyPressed()
{
  pressed[keyCode] = true;
}
void keyReleased()
{
  pressed[keyCode] = false;
  p.vel.set(0, 0);

  downPressed = false;
  upPressed = false;
  rightPressed = false;
  leftPressed = false;
}


void controlsMove() {
  if (pressed[87]) {
    p.vel.y = -9;
  }

  if (pressed[65]) {
    p.vel.x = -9;
  }

  if (pressed[83]) {
    p.vel.y = 9;
  }

  if (pressed[68]) {
    p.vel.x = 9;
  }

  if (pressed[87] && pressed[68] || pressed[87] && pressed[65] || pressed[83] && pressed[68] || pressed[83] && pressed[65]) {
    p.vel.mult(0.6);
  }

  if (pressed[32] && dashTimer < 7) {

    if (artifactType == 3) {
      if (dashTimer < 1) {
        damage = 0.4;
        for (int i = 0; i < 20; i++) {
          balls.add(new PosseidonProjectile());
        }
      }
    }

    p.vel.mult(3);
    dashTimer++;
    dashReset = 0;
    antal_p=4;
    c=(255);
    systems.add(new ParticleSystem(p.pos.x, p.pos.y));
  }
}

void controlsShoot() {
  if (mousePressed == true) {
    if (mouseButton == LEFT) {
      if (shootTimer > round(20*shtSpeedScale)) {
        //Animationen for skudet
        PVector dis = new PVector(mouseX-p.pos.x, mouseY-p.pos.y);
        dis.normalize();
        dis.mult(30);
        antal_p=10;
        shootTimer = 0;
        c=color(255, random(175, 225), 38);
        systems.add(new ParticleSystem(p.pos.x+dis.x, p.pos.y+dis.y));

        //Spawner skud
        for (int i = 0; i < amount; i++) {
          balls.add(p.currentWeapon.GetProjectile());
        }
      }
    }

    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////    
    if (hitTimer > round(20*hitSpeedScale) || resetTimer > 5) {
      if (mouseButton == RIGHT) {

        reset=false;
        resetTimer=0;
        switch(meleeType) {

        case 1:
          c2 = color(150, 0, 0);
          c1 = color(255);
          swords.add(new Sword(new PVector(p.pos.x, p.pos.y)));
          hitSpeedScale = 1.2;
          mDamage = 0.5;

          if (artifactType == 1 && hitTimer2 > 40) {
            for (int i = 0; i < 2; i++) {
              damage=1;
              balls.add(new OsirisProjectile());
            }
            hitTimer2=0;
          }


          break;

        case 2:
          swords.add(new Sword(p.pos));
          c1 = color(255, 122, 195);
          c2 = color(102, 71, 52);
          hitSpeedScale = 5;
          mDamage = 0.5;
          if (s.decay > 0) {
            canHit= 0;
          } else {
            canHit = 60;
          }
          break;
        }
        hitTimer = 0;
      }
    }
  }
}
