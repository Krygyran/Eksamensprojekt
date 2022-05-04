class Ball {

  PVector location; //kuglens lokation
  PVector velocity; //kuglens hastighed
  PVector acceleration; //kuglens acceleration
  int speed = 20;
  int life;
  int decay;

  //constructor
  Ball() {
    location = new PVector(p.pos.x, p.pos.y);
    velocity = new PVector((mouseX-p.pos.x)+random(-50, 50), (mouseY-p.pos.y)+random(-50, 50));
    acceleration = new PVector(0, 0);
    life=1;
    decay = 1000;
  }


  //opdaterer kuglens position
  void update() {
    velocity.normalize();
    velocity.mult(40);
    location.add(velocity);
  }

  //viser kuglen
  void display() {
    noStroke();
    fill(255, 255, 77);
    ellipse(location.x, location.y, 12, 12);
  }
}


void delete() { //kuglerne fra arraylisten når de er ude fra skærmen

  for (int i=balls.size()-1; i >= 0; i--) {
    Ball b = balls.get(i);
    if (b.location.y < r.stopYMin + 5 || b.location.y > r.stopYMax - 5 || b.location.x > r.stopXMax - 5 || b.location.x < r.stopXMin + 5) {
      balls.remove(b);
      antal_p=10;
      c=color(255, random(175, 225), 38);
      systems.add(new ParticleSystem(b.location.x, b.location.y));
    }
    if (b.decay < 1) {
      balls.remove(b);
    }
  }
}
