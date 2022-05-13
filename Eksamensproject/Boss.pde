class Boss {
  PVector location;
  PVector vel;
  PVector acc;
  int maxHealth;
  int bossType;
  float speed;
  float blife;
  boolean hit;
  int shootTimer;
  int amount = 5;
  int attackTimer;
  int attackTimer2;
  int shots;
  boolean activate;
  String bossName;
  int s;
  int st;
  boolean eDash;
  int dashTime;


  Boss(int type, PVector pos) {
    location = pos;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    bossType = type;
    maxHealth = 100;
    blife = 100;
  }


  void update() {

    switch(bossType) {

    case 1:
      float l2 = dist(p.pos.x, p.pos.y, location.x, location.y);


      if (blife > maxHealth*0.5 && l2 < 500) {
        acc = PVector.sub(location, p.pos);
      } else {
        acc = PVector.sub(p.pos, location);
      }

      if (blife > maxHealth*0.5) {
        bossName = "Pharoah";
        s=3;
        amount = 3;
        st = 30;
      } else {
        bossName = "Osiris";
        s=3;
        amount = 100;
        st = 1;
      }


      break;

    case 2:
      acc = PVector.sub(p.pos, location);
      bossName = "Undead samurai";
      amount = 30;
      st = 3;
      if (eDash == true) {
        s=16;
      } else {
        s=0;
      }
      break;

    case 3:
      acc = PVector.sub(p.pos, location);
      bossName = "Posseidon";
      amount = 1;
      st = 100;


      break;
    }

    acc.normalize();
    acc.mult(2);

    //giver den en hastighed og rykker fjenden
    vel.add(acc);
    vel.limit(speed);
    location.add(vel);
  }

  void display() {
    rectMode(CENTER);
    stroke(0);
    strokeWeight(1);

    switch(bossType) {

      ////////////////////////Første boss////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    case 1:
      if (hit == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        if (blife <= maxHealth*0.5) {
          fill(70, 100, 0);
        } else {
          fill(66, 59, 25);
        }
      }



      rect(location.x, location.y, 150, 150);
      speed = 5;


      if (shots < amount) {
        shootTimer++;
        speed=s;
        if (shootTimer > st ) {
          if (blife > maxHealth*0.5) {
            animations.add(new SpawnAnimation(new PVector(random(r.stopXMin+100, r.stopXMax-100), random(r.stopYMin+100, r.stopYMax-100)), 3));
          } else {
            eballs.add(new Enemy_ball(location.x, location.y, 1.5, color(222, 187, 31), 5, 150));
            speed=s;
          }
          shootTimer = 0;
          shots++;
          activate = false;
        }
      } else {
        activate = true;
      }

      if (attackTimer > 480) {
        shots = 0; 
        attackTimer = 0;
      }

      if (attackTimer2 > 70) {
        eballs.add(new Enemy_ball(location.x, location.y, 1.5, color(222, 187, 31), 5, 150));
        attackTimer2 = 0;
      }





      break;


      ////////////////////////Anden boss////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case 2:
      if (hit == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(59, 5, 1);
      }

      rect(location.x, location.y, 150, 150);
      speed = 5;


      if (shots < amount) {
        shootTimer++;
        speed=s;
        if (shootTimer < st ) {
          if (eDash == false) {
            eballs.add(new Enemy_ball(location.x, location.y, 1.5, color(255, 122, 195), 5, 5000));
          } else {
            dashTime++;
          }
          shootTimer = 0;
          shots++;
          activate = false;
        }
      } else {
        activate = true;
      }

      if (attackTimer > 150) {
        shots = 0; 
        attackTimer = 0;
      }

      if (attackTimer2 > 70) {
        eDash=true;
        attackTimer2 = 0;
      }

      if (dashTime > 30) {
        eDash = false; 
        dashTime = 0;
      }






      break;

      ////////////////////////Tredje boss////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case 3:
      if (hit == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(200);
      }

      rect(location.x, location.y, 150, 150);
      speed = 2;


      if (shots < amount) {
        shootTimer++;
        speed=s;
        if (shootTimer < st ) {
          animations.add(new SpawnAnimation(new PVector(random(r.stopXMin+100, r.stopXMax-100), random(r.stopYMin+100, r.stopYMax-100)), 3));
          shootTimer = 0;
          shots++;
          activate = false;
        }
      } else {
        activate = true;
      }

      if (attackTimer > 150) {
        for (int i = 0; i < 35; i++) {
          eballs.add(new Enemy_ball(location.x, location.y, 1.5, color(0, 122, 195), 5, 5000));
        }
        shots = 0; 
        attackTimer = 0;
      }

      if (attackTimer2 <= 141) {
        fill(0, 122, 195, attackTimer2);
        rect(width/2, height/2, width, height);
      }

      if (attackTimer2 > 140) {
        attackTimer2 = 140;
        p.vel.mult(0.7);
      }



      break;
    }

    if (blife <= 0 ) {
      explosions.add(new Explosion(location));
      bossKilled = true;
      r.boss=false;
    }

    if (activate == true) {
      attackTimer++;
      attackTimer2++;
    }

    println(eDash);
  }
}
