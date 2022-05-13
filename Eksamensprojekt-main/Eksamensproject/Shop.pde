boolean w2;
boolean w3;
boolean w4;
boolean w5;



class Wares {
  int ware1 = round(random(2, 3));
  int ware2 = round(random(4, 5));


  int cost = 10;
  int gun = 2;  
  int x = 500;
  int y = 500; 
  int x2 = 800;
  int y2 = 500;


  int radius = 50;
  int type; 
  int o = 0;
  int o2 = 0;


  Wares(int type_) {
    type = type_;
  }


  void display() {
    fill(251, 255, 75);
    textSize(20);

    text("20 gold pieces", x+150, y+120);  


    ellipseMode(CENTER);
    noStroke();
    fill(100, 255, 255, o);
    ellipse(x, y, radius, radius); 
    if (w2 == true) {
      image(gun2, x, y, 100, 100);
    }
    if (w3 == true) {
      image(gun3, x, y, 100, 100);
    }
    if (w4 == true) {
      image(gun4, x2, y2, 100, 100);
    }
    if (w5 == true) {
      image(gun5, x2, y2, 100, 100);
    }

    fill(128, 255, 50, o2);
    ellipse(x2, y2, radius, radius);
  }


  void update() {
    if (dist(x, y, p.pos.x, p.pos.y)<= radius && (Coinz >= 20)) {
      weaponType = ware1;
      o = 0;
      x = 100000;
      Coinz = Coinz-20;
    }

    if (dist(x2, y2, p.pos.x, p.pos.y)<=radius && (Coinz >= 20)) {
      weaponType = ware2;
      o2 = 0;
      x2 = 100000;
      Coinz = Coinz-20;
    }
  }
}
