class Weapon
{
  Ball project;
  String name;
  PVector savedR;
  Weapon(String _name)
  {
    name = _name;
    project = null;
  }
  Ball GetProjectile()
  {
    return new Ball();
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class MjolnirProjectile extends Ball
{
  PVector retning;
  MjolnirProjectile()
  {
    super();
    life=100;
    decay = 22;
  }
  void update()
  {
    acceleration = PVector.sub(p.pos, location); //trækker kuglen tilbage mod startpositionen
    acceleration.mult(0.1);
    velocity.mult(1.9);
    velocity.add(acceleration);
    velocity.limit(40);
    location.add(velocity);  
    acceleration.mult(0);
  }
}

class Mjolnir extends Weapon {


  Mjolnir() {
    super("Mjolnir");
  }

  Ball GetProjectile()
  {
    return new MjolnirProjectile();
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class PistolProjectile extends Ball
{

  PistolProjectile()
  {
    super();
  }
}

class Pistol extends Weapon {


  Pistol() {
    super("Pistol");
  }

  Ball GetProjectile()
  {
    return new PistolProjectile();
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class DragonProjectile extends Ball
{

  DragonProjectile()
  {
    super();
    life = 1000;
    decay = 30;
  }

  void update()
  {
    velocity.set(new PVector(velocity.x+random(-1, 1), velocity.y+random(-1, 1)));
    velocity.mult(0.96);
    velocity.limit(30);
    location.add(velocity);
  }
  void display() {
    c = color(255, random(60, 180), 0, round(8.5*decay));
    antal_p=5;
    systems.add(new ParticleSystem(location.x, location.y));
  }
}



class Dragon extends Weapon {


  Dragon() {
    super("Dragon");
  }

  Ball GetProjectile()
  {
    return new DragonProjectile();
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class RocketProjectile extends Ball
{

  Weapon w;
  RocketProjectile()
  {
    super();
    decay = 30;
  }

  void update() {
    velocity.normalize();
    velocity.mult(20);
    location.add(velocity);
  }

  void display() {
    noStroke();
    fill(50, 50, 50);
    ellipse(location.x, location.y, 15, 15);
    antal_p = 3;
    c = color(255,255,255,150);
    systems.add(new ParticleSystem(location.x, location.y));
    antal_p = 1;
    c = color(255, random(60, 180), 0);
    systems.add(new ParticleSystem(location.x, location.y));

    if (decay == 1) {
      explosions.add(new Explosion(location));
      translate(5, 5);
      translate(-5, -5);
      translate(5, -5);
      translate(0, 0);
    }
  }
}

class Rocket extends Weapon {


  Rocket() {
    super("Rocket");
  }

  Ball GetProjectile()
  {
    return new RocketProjectile();
  }
}
