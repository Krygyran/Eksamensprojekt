class Player {
  PVector pos;
  PVector vel;
  int speed = 3;
  int wSize = 25;
  int hSize = 25;
  int y= 500;

  Weapon currentWeapon;

  Player() {
    pos = new PVector(400, y);
    vel = new PVector(0, 0);
  }

  void update() {
    pos.add(vel);
  }

  void display() {
    strokeWeight(1);
    stroke(0);
    //tegner spilleren
    fill(random(100, 166), 233, 247);
    ellipse(pos.x, pos.y, wSize, wSize);
  }

  void weaponDetect() 
  {
    switch(weaponType) {

    case 1:
      currentWeapon = new Pistol();
      shtSpeedScale = 1.2;
      amount=1;
      break;
    
    case 2:
      currentWeapon = new Pistol();
      shtSpeedScale = 1;
      amount=6;
      break;
      
     case 3:
      currentWeapon = new Pistol();
      shtSpeedScale = 0.25;
      amount=1;
      break;
    

    case 4:
      currentWeapon = new Mjolnir();
      shtSpeedScale = 1.2;
      c = color(0, random(180, 230), 255);
      antal_p = 15;
      amount=1;
      break;

    case 5:
      currentWeapon = new Dragon();
      shtSpeedScale = 0.1;
      damage = 0.1;
      antal_p = 5;
      amount=1;
      break;
      
      case 6:
      currentWeapon = new Rocket();
      shtSpeedScale = 5;
      damage = 2;
      antal_p = 5;
      amount=1;
      break;
    }
  }
}
