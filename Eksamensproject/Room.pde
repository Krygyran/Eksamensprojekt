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
  

  Room() {
    roomType= round(random(1, 5));
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
      break;

    case 2:
      stopXMin = 250;
      stopXMax = 1250;
      stopYMin = 50;
      stopYMax = 900;
      offsetY = 50;
      offsetX = 250;
      maxEnemies = 4;
      break;

    case 3:
      stopXMin = 5;
      stopXMax = 1495;
      stopYMin = 5;
      stopYMax = 995;
      offsetX = 5;
      offsetY = 5;
      maxEnemies = 6;
      break;

    case 4:
      stopXMin = 400;
      stopXMax = 1100;
      stopYMin = 5;
      stopYMax = 995;
      offsetX = 400;
      offsetY = 5;
      maxEnemies = 3;
      break;

    case 5:
      stopXMin = 100;
      stopXMax = 1400;
      stopYMin = 100;
      stopYMax = 900;
      offsetX = 100;
      offsetY = 100;
      maxEnemies = 5;
      break;
    }
    
    enemySpawn();
  }

  void display() {
    noFill();
    strokeWeight(7);
    stroke(255);
    rect(stopXMin, stopYMin, stopXMax-offsetX, stopYMax-offsetY);
  }
}

void wallCollision(){
 if(p.pos.x < r.stopXMin+9) {
   p.pos.x = r.stopXMin+10;
 }
 if(p.pos.x > r.stopXMax-9) {
   p.pos.x = r.stopXMax-10;
 }
 if(p.pos.y < r.stopYMin+9) {
   p.pos.y = r.stopYMin+10;
 }
 if(p.pos.y > r.stopYMax-9) {
   p.pos.y = r.stopYMax-10;
 }
 
  
  
}
