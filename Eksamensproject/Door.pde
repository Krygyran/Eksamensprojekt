boolean enter;

class Door {
  PVector pos;
  PVector spawnPoint;
  int w;
  int h;
  int randomizer;
  int newRoom;
  String direction; 
  String spawnDirection;



  Door() {
    pos = new PVector(0, 0);
    randomizer = round(random(1, 4));
  }

  void update() {

    switch(randomizer) {

    case 1:
      pos = new PVector(r.stopXMax, (r.stopYMax+r.offsetY)/2);
      spawnPoint = new PVector(r.stopXMin+50, (r.stopYMax+r.offsetY)/2);
      w = 50;
      h = 100;
      direction = "right";
      spawnDirection = "left";
      break;


    case 2:
      pos = new PVector((r.stopXMax+r.offsetX)/2, r.stopYMin);
      spawnPoint = new PVector((r.stopXMax+r.offsetX)/2, r.stopYMax-50);
      w = 100;
      h = 50;
      direction = "up";
      spawnDirection = "down";
      break;


    case 3: 
      pos = new PVector(r.stopXMin, (r.stopYMax+r.offsetY)/2);
      spawnPoint = new PVector(r.stopXMax-50, (r.stopYMax+r.offsetY)/2);
      w = 50;
      h = 100;
      direction = "left";
      spawnDirection = "right";
      break;


    case 4:
      pos = new PVector((r.stopXMax+r.offsetX)/2, r.stopYMax);
      spawnPoint = new PVector((r.stopXMax+r.offsetX)/2, r.stopYMin+50);
      w = 100;
      h = 50;
      direction = "down";
      spawnDirection = "up";
      break;
    }
  }


  void display() {
   if(enter == true){
    rectMode(CENTER);
    fill(255, 0, 0);
    rect(pos.x, pos.y, w, h);
    }
  }
}

void defineDoors() {
  doors[0] = new Door();
  doors[1] = new Door();
}

void enterDoor() {

  for (Door d : doors) {
    float distance = dist(p.pos.x, p.pos.y, d.pos.x, d.pos.y);
    if (enter == true) {
      if (distance < 50) {
        saveDirection = d.spawnDirection;
        r.roomType= round(random(1, 5));
        defineDoors();
        p.pos = d.spawnPoint;
        enter = false;
        enemySpawn();
      }
    }
    if(d.direction == saveDirection) {
      defineDoors();
    }
  }
}
