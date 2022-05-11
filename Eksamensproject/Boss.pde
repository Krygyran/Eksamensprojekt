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
        amount = 30;
        st = 3;
      }


      break;

    case 2:
      acc = PVector.sub(p.pos, location);
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
        fill(200);
      }

      if (blife <= maxHealth*0.5)
      {
        fill(70, 100, 0);
      }

      rect(location.x, location.y, 150, 150);
      speed = 5;


      if (shots < amount) {
        shootTimer++;
        speed=s;
        if (shootTimer > st ) {
          if(blife > maxHealth*0.5){
          animations.add(new SpawnAnimation(new PVector(random(r.stopXMin+100, r.stopXMax-100), random(r.stopYMin+100, r.stopYMax-100)), 3));
          }
          else{
            eballs.add(new Enemy_ball(location.x, location.y, 1.5, color(222, 187, 31), 5));
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
        eballs.add(new Enemy_ball(location.x, location.y, 1.5, color(222, 187, 31), 5));
        attackTimer2 = 0;
      }





      break;


      ////////////////////////Anden enemy////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case 2:




      break;

      ////////////////////////Tredje Enemy////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    case 3:


      break;
    }

    if (blife <= 0) {
      explosions.add(new Explosion(location));
      r.boss=false;
    }

    if (activate == true) {
      attackTimer++;
      attackTimer2++;
    }
  }
}
