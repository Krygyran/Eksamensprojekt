class Sword {

   PVector location; //kuglens lokation
  PVector velocity; //kuglens hastighed
  PVector acceleration; //kuglens acceleration
  int speed = 20;
  int life;
  int decay;

  Sword(PVector position) {
    location = position; //new PVector(p.pos.x,p.pos.y); 
    velocity = new PVector(mouseX-p.pos.x, mouseY-p.pos.y);
    acceleration = new PVector(0, 0);
    life=100;
    decay = 13;
  }

  void update()
  {
    acceleration = PVector.sub(p.pos, location); //trækker kuglen tilbage mod startpositionen
    acceleration.mult(0.08);
    velocity.mult(1.2);
    velocity.add(acceleration);
    velocity.limit(30);
    location.add(velocity);  
    acceleration.mult(0);
  }

  void display() {
    antal_p=3;
    c=c1;
    systems.add(new ParticleSystem(location.x, location.y));
    antal_p = 1;
    c=c2;
    systems.add(new ParticleSystem(location.x, location.y));
  }
  
}

void detect(){
 for (int i =swords.size()-1; i >= 0; i--) {
    Sword s = swords.get(i);
    if (s.decay < 1) {
      swords.remove(s);
    }
  }
}
