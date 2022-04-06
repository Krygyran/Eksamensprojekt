class ParticleSystem //gør at particler kan spawne flere steder
{
  ArrayList<Particle> particleArr;
  int parts; //dele af partiklerne

  ParticleSystem()
  {
    particleArr = new ArrayList<Particle>();
    parts = 0;
    for (int z = 0; z < antal_p; z++)
    {
      Particle p = new Particle(c); //giver dem et sted at spawne
      p.x = 0;
      p.y = 0;
      particleArr.add(p);
      parts++;
    }
  }
  ParticleSystem(float x, float y)
  {
    particleArr = new ArrayList<Particle>(); //gør at der kan tilføjes flere eksplosioner
    parts = 0;
    for (int z = 0; z < antal_p; z++)
    {
      Particle p = new Particle(c);
      p.x = x;
      p.y = y;
      particleArr.add(p);
      parts++;
    }
  }

  void update() //opdaterer particlerne (får dem til at forsvinde og fremstå)
  {

    for (int i = 0; i < parts; i++) {
      particleArr.get(i).update();

      if (!particleArr.get(i).visible) {
        particleArr.remove(particleArr.get(i));
        parts--;
      } else {
        particleArr.get(i).update();
      }
    }
  }
  void display()
  {

    for (int i = 0; i < parts; i++)
    {
      particleArr.get(i).render();
    }
  }
}

///////////////////////////////////////////////////////////Selve partiklen//////////////////////////////////////////////////////////////

class Particle { //tegner particler
  float x, y;    // position
  float dx, dy;  // hastighed
  float r;       // radius
  float dr;      // hvordan den skifter radius, med tilfældighed
  color c;


  boolean visible; //om particles kan ses eller ej

  Particle(color c_) {
    reset();
    c = c_;
  }

  void reset() {
    dx = random(-3.0, 3.0);   // Disse værdier kan ændres for at få forskellige former for eksplosioner
    dy = random(-3.0, 3.0);   
    r = random(5.0, 8.0);   
    dr = random(-1, -0.2);
    visible = true;
  }

  //tegner ellipserne der en del af vores particle
  void render() {
    if (visible) {
      fill(c);
      noStroke();
      rect(x, y, r*2, r*2);
    }
  }

  void update() { //bevæger partiklerne i givne retninger
    x += dx;
    y += dy;
    r += dr;
    if (r < 1) {   //fjerne en particle når den bliver for lille
      visible = false;
    }
  }
}
