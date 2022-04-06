int enemyAntal = 1;

class Enemy {
  PVector location;
  PVector vel;
  PVector acc;
  int enemyType;
  float speed;
  float eLife;
  boolean hit;
  int eshootTimer;
  int eAmount = 5;
  int eAttackTimer;
  int shots;
  boolean activate;

  Enemy(int type) {
    location = new PVector(random(500, 1000), random(1000));
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    enemyType = type;
  }


  void update() {
    acc = PVector.sub(p.pos, location);
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
    switch(enemyType) {

      ////////////////////////Første Enemy

    case 1:
      if (hit == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(200);
      }

      rect(location.x, location.y, 50, 50);
      speed = 5;


      if (shots < 2) {
        speed = 1;
        eshootTimer++;
        if (eshootTimer > random(20, 40) ) {
          eballs.add(new Enemy_ball(location.x, location.y, 2));
          eshootTimer = 0;
          shots++;
          activate = false;
        }
      } else {
        activate = true;
      }

      if (eAttackTimer > 120) {
        shots = 0; 
        eAttackTimer = 0;
      }



      break;


      ////////////////////////Anden enemy
    case 2:
      if (hit == true) {
        fill(255, 80, 80);
        hit = false;
        speed = 20;
      } else {
        fill(200);
      }

      speed = 2;
      rect(location.x, location.y, 70, 70);


      if (shots < 15) {
        speed = 1;
        eshootTimer++;
        if (eshootTimer > random(5, 10) ) {
          eballs.add(new Enemy_ball(location.x, location.y, 1));
          eshootTimer = 0;
          shots++;
          activate = false;
        }
      } else {
        activate = true;
      }

      if (eAttackTimer > 120) {
        shots = 0; 
        eAttackTimer = 0;
      }



      break;

      ////////////////////////Tredje Enemy
    case 3:
      if (hit == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(200);
      }

      rect(location.x, location.y, 30, 30);
      speed = 8;



      break;

      ////////////////////////Fjerde Enemy     
    case 4:
      if (hit == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(200);
      }

      rect(location.x, location.y, 45, 45);
      speed = 5;


      if (shots < 2) {
        speed = 1;
        eshootTimer++;
        if (eshootTimer > random(30, 60) ) {

          for (int i = 0; i < eAmount; i++) {  
            eballs.add(new Enemy_ball(location.x, location.y, 1.5));
          }
          eshootTimer = 0;
          shots++;
          activate = false;
        }
      } else {
        activate = true;
      }

      if (eAttackTimer > 120) {
        shots = 0; 
        eAttackTimer = 0;
      }


      break;
    }
    if (activate == true) {
      eAttackTimer++;
    }
  }
}


////////////////////////Spawn af enemy
void enemySpawn() {
  for (int i = 0; i < enemyAntal; i++) {
    enemies.add(new Enemy(round(random(1, 4))));

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
