class Room {


  int stopXMin;
  int stopXMax;
  int stopYMin;
  int stopYMax;
  int offsetX;
  int offsetY;
  int roomType;
  PVector spawnPoint;
  int maxEnemies;
  boolean boss = false;
  boolean shop = false;
  boolean start = true;
  PImage room;
  


  Room() {
    roomType= 7;//round(random(1, 6));
    stopXMin = 50;
    stopXMax = 50;
    stopYMin = 50;
    stopYMax = 50;
  }


  void update() {
    
    switch(roomType) {

    case 1:
      stopXMin = 100;
      stopXMax = 1400;
      stopYMin = 5;
      stopYMax = 900;
      offsetX = 100;
      offsetY = 5;
      maxEnemies = 4;
      shop = false;
      start = false;
      break;

    case 2:
      stopXMin = 250;
      stopXMax = 1250;
      stopYMin = 50;
      stopYMax = 900;
      offsetY = 50;
      offsetX = 250;
      maxEnemies = 4;
      shop = false;
      start = false;
      break;

    case 3:
      stopXMin = 5;
      stopXMax = 1495;
      stopYMin = 5;
      stopYMax = 995;
      offsetX = 5;
      offsetY = 5;
      maxEnemies = 6;
      shop = false;
      start = false;
      break;

    case 4:
      stopXMin = 400;
      stopXMax = 1100;
      stopYMin = 5;
      stopYMax = 995;
      offsetX = 400;
      offsetY = 5;
      maxEnemies = 3;
      shop = false;
      start = false;
      break;

    case 5:
      stopXMin = 100;
      stopXMax = 1400;
      stopYMin = 100;
      stopYMax = 900;
      offsetX = 100;
      offsetY = 100;
      maxEnemies = 0;
      println("welcome to the shop!");
      shop = true;
      w.x = 500;
      w.y = 500; 
      w.x2 = 800;
      w.y2 = 500;
      p.pos.x = width/2;
      p.pos.y = height/2+200;
      start = false;
      break;

    case 6:
      stopXMin = 100;
      stopXMax = 1400;
      stopYMin = 100;
      stopYMax = 900;
      offsetX = 100;
      offsetY = 100;
      maxEnemies = 5;
      shop = false;
      start = false;
      break;

    case 7:
      stopXMin = 5;
      stopXMax = 1495;
      stopYMin = 5;
      stopYMax = 995;
      offsetX = 5;
      offsetY = 5;
      boss = true;
      shop = false;
      start = false;
      break;
      
      
        case 8:
      stopXMin = 250;
      stopXMax = 1250;
      stopYMin = 50;
      stopYMax = 900;
      offsetY = 50;
      offsetX = 250;
      shop = false;
      break;
    }

    if (boss == false && shop == false && start == false) {
      enemySpawn();
    }
    
  }

  void display() {
    
     switch(worldCounter){
      
      case 1:
      room = room1;
      break;
      
      
      case 2:
      room = room2;
      break;
      
      case 3:
      room = room3;
      break;
      
      case 4:
      room = room3;
      break;
      
      
    }
    
    
    noFill();
    strokeWeight(7);
    stroke(255);
    image(room,stopXMin, stopYMin, stopXMax-offsetX, stopYMax-offsetY);
    
  }
}

void wallCollision() {
  if (p.pos.x < r.stopXMin+9) {
    p.pos.x = r.stopXMin+10;
  }
  if (p.pos.x > r.stopXMax-9) {
    p.pos.x = r.stopXMax-10;
  }
  if (p.pos.y < r.stopYMin+9) {
    p.pos.y = r.stopYMin+10;
  }
  if (p.pos.y > r.stopYMax-9) {
    p.pos.y = r.stopYMax-10;
  }

  if (bo.location.x < r.stopXMin+9) {
    bo.location.x = r.stopXMin+10;
  }
  if (bo.location.x > r.stopXMax-9) {
    bo.location.x = r.stopXMax-10;
  }
  if (bo.location.y < r.stopYMin+9) {
    bo.location.y = r.stopYMin+10;
  }
  if (bo.location.y > r.stopYMax-9) {
    bo.location.y = r.stopYMax-10;
  }
}
