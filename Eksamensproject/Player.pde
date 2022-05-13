class Player {
  PVector pos;
  PVector vel;
  PVector rotation;
  int speed = 3;
  int wSize = 30;
  int hSize = 30;
  int y= 500;

  Weapon currentWeapon;

  Player() {
    pos = new PVector(750, 500);
    vel = new PVector(0,0);
    rotation = new PVector(mouseX-pos.x, mouseY-pos.y);
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    strokeWeight(1);
    stroke(0);
    //tegner spilleren
    fill(255,255,50);
    ellipse(pos.x, pos.y, wSize, wSize);

  }

  void weaponDetect() 
  {
    switch(weaponType) {

    case 1:
      currentWeapon = new Pistol();
      damage = 1.5;
      shtSpeedScale = 1.2;
      amount=1;
      knockBack = 1;
      break;
    
    case 2:
      currentWeapon = new Pistol();
      damage = 1.1;
      shtSpeedScale = 3.5;
      amount=6;
      knockBack = 1;
      break;
      
     case 3:
      currentWeapon = new Pistol();
      damage = 0.75;
      shtSpeedScale = 0.25;
      amount=1;
      knockBack = 0.5;
      break;

    case 4:
      currentWeapon = new Dragon();
      shtSpeedScale = 0.1;
      damage = 0.05;
      antal_p = 5;
      amount=1;
      knockBack = 0.001;
      break;
      
      case 5:
      currentWeapon = new Rocket();
      shtSpeedScale = 5;
      damage = 2;
      antal_p = 5;
      amount=1;
      knockBack = 5;
      break;
    }
  }
}
