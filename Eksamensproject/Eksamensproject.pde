import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;



int dashTimer = 0;
int dashReset = 0;
int antal_p;
color c;

PVector retning = new PVector();

Player p = new Player();
Ball b = new Ball();
Sword s = new Sword(p.pos);
PostFX fx;

ArrayList <Ball> balls;
ArrayList <Sword> swords;
ArrayList<ParticleSystem> systems;


void setup() {
  size(1000, 1000, P3D); 
  rectMode(CENTER);
  fx = new PostFX(this);
  balls = new ArrayList<Ball>();
  swords = new ArrayList<Sword>();
  systems = new ArrayList<ParticleSystem>();
}

void draw() {
  background(0);
  detect();
  delete();

  for (Ball b : balls) {
    b.update();
    b.display();
    b.decay--;
  }
  
   for (Sword s : swords) {
    s.update();
    s.display();
    s.decay--;
  }

  for (ParticleSystem ps : systems) {
    ps.update();
    ps.display();
  }

  p.update();
  p.display(); 
  p.weaponDetect();
  controlsMove();

  if (dashReset == 60) {
    dashTimer = 0;
  }

  if (dashReset != 60) {
    dashReset++;
  }

  
    fx.render()
    .bloom(0.0001, 20, 40)
    .pixelate(250)
    .compose();
    
    println(balls.size());
}




void mousePressed() {
  if (mouseButton == LEFT) {
    //Animationen for skudet
    PVector dis = new PVector(mouseX-p.pos.x, mouseY-p.pos.y);
    dis.normalize();
    dis.mult(30);
    antal_p=10;
    c=color(255, random(175, 225), 38);
    systems.add(new ParticleSystem(p.pos.x+dis.x, p.pos.y+dis.y));
    
    //Spawner skud
    for(int i = 0; i < 1; i++){
    balls.add(p.currentWeapon.GetProjectile());
    }
    
  }
  if (mouseButton == RIGHT) {
    swords.add(new Sword(new PVector(p.pos.x,p.pos.y)));//p.pos));
  }
}
