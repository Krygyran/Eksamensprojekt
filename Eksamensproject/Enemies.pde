int enemyAntal;

class Enemy {
  PVector location;
  PVector vel;
  PVector acc;
  int enemyType;
  int maxLife;
  float speed;
  float eLife;
  boolean hit;
  boolean execute = false;
  int eshootTimer;
  int eAmount = 5;
  int eAttackTimer;
  int shots;
  boolean activate;
  color c1;

  Enemy(int type, PVector pos) {
    location = pos;
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
    
    switch(worldCounter){
     
      case 1:
      c1 = color(222, 187, 31);
      break;
      
      
      case 2:
      c1 = color(255, 122, 195);
      break;
      
      
      case 3:
      c1 = color(0, 122, 195);
      break;
    }
    
    
    
switch(enemyType) {

      ////////////////////////Første Enemy

    case 1:
      if (hit == true || execute == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(200);
      }
      if (eLife <= 0.4*maxLife) {
        execute = true;
      }

      rect(location.x, location.y, 50, 50);
      speed = 5;


      if (shots < 2) {
        speed = 1;
        eshootTimer++;
        if (eshootTimer > random(20, 40) ) {
          eballs.add(new Enemy_ball(location.x, location.y, 4,c1,2,220));
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
      if (hit == true || execute == true) {
        fill(255, 80, 80);
        hit = false;
        speed = 20;
      } else {
        fill(200);
      }
      if (eLife <= 0.4*maxLife) {
        execute = true;
      }

      speed = 2;
      rect(location.x, location.y, 70, 70);


      if (shots < 15) {
        speed = 1;
        eshootTimer++;
        if (eshootTimer > random(5, 10) ) {
          eballs.add(new Enemy_ball(location.x, location.y, 1.2,c1,2,220));
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
      if (hit == true || execute == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(200);
      }
      if (eLife <= 0.4*maxLife) {
        execute = true;
      }

      rect(location.x, location.y, 30, 30);
      speed = 8;

      if (eAttackTimer > 120) {
        shots = 0; 
        eAttackTimer = 0;
      }



      break;

      ////////////////////////Fjerde Enemy     
    case 4:
      if (hit == true || execute == true) {
        fill(255, 80, 80);
        speed = 20;
        hit = false;
      } else {
        fill(200);
      }
      if (eLife <= 0.4*maxLife) {
        execute = true;
      }

      rect(location.x, location.y, 45, 45);
      speed = 5;


      if (shots < 2) {
        speed = 1;
        eshootTimer++;
        if (eshootTimer > random(30, 60) ) {

          for (int i = 0; i < eAmount; i++) {  
            eballs.add(new Enemy_ball(location.x, location.y, 1.2,c1,2,220));
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
    animations.add(new SpawnAnimation(new PVector(random(r.stopXMin+100, r.stopXMax-100), random(r.stopYMin+100, r.stopYMax-100)),round(random(1, 4))));
  }
}
