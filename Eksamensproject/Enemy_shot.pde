class Enemy_ball {

  PVector location; //kuglens lokation
  PVector velocity; //kuglens hastighed
  PVector acceleration; //kuglens acceleration
  float speed = 20;
  int life;
  int decay;
  int c2;
  int t;

  //constructor
  Enemy_ball(float ex, float ey, float _speed, color c_, int t_, int spread) {
    location = new PVector(ex, ey);
    velocity = new PVector((p.pos.x-location.x) +random(-spread ,spread), (p.pos.y-location.y)+random(-spread,spread));
    acceleration = new PVector(0, 0);
    life=1;
    decay = 1000;
    speed = _speed;
    c2=c_;
    t = t_;
  }


  //opdaterer kuglens position
  void update() {
    velocity.normalize();
    velocity.mult(7*speed);
    location.add(velocity);
  }

  //viser kuglen
  void display() {
    antal_p = t;
    c=c2;
    systems.add(new ParticleSystem(location.x, location.y));
  }
}


void deleteE() { //fjerner kuglerne fra arraylisten når de er ude fra skærmen

  for (int i=eballs.size()-1; i >= 0; i--) {
    Enemy_ball eb = eballs.get(i);
    if (eb.location.y < r.stopYMin || eb.location.y > r.stopYMax|| eb.location.x > r.stopXMax || eb.location.x <r.stopXMin) {
      eballs.remove(eb);
    }
  }
}
