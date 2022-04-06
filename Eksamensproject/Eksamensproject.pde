import ch.bildspur.postfx.builder.*;
import ch.bildspur.postfx.pass.*;
import ch.bildspur.postfx.*;


int temp;
int dashTimer = 0;
int dashReset = 0;
int antal_p;
int shootTimer;
int hitTimer;
int healTimer;
color c;
int amount;

//Stats
int maxLives = 10;
int lives = 10;
float shtSpeedScale;
float hitSpeedScale;
float damage = 1;
float mDamage;
int canHit;


PVector retning = new PVector();

Player p = new Player();
Ball b = new Ball();
Sword s = new Sword(p.pos);
Enemy e = new Enemy(round(random(1,3)));
Enemy_ball eb = new Enemy_ball(1, 1,1);

PostFX fx;

ArrayList <Ball> balls;
ArrayList <Sword> swords;
ArrayList<ParticleSystem> systems;
ArrayList <Enemy_ball> eballs;
ArrayList <Enemy> enemies;

/////VÅBENTYPE//////
int weaponType=5;///
int meleeType=1;////
////////////////////


void setup() {
  size(1500, 1000, P2D); 
  rectMode(CENTER);
  fx = new PostFX(this);
  balls = new ArrayList<Ball>();
  swords = new ArrayList<Sword>();
  systems = new ArrayList<ParticleSystem>();
  enemies = new ArrayList<Enemy>();
  eballs = new ArrayList<Enemy_ball>();
}

void draw() {
  background(0);
  
  detect();
  detect2();
  detect3();
  detect4();
  detect5();
  delete();
  deleteE();

  for (Ball b : balls) {
    b.update();
    b.display();
    b.decay--;
  }
  
  for (Enemy e : enemies) {
    e.update();
    e.display();
  }

  for (Enemy_ball eb : eballs) {
    eb.display();
    eb.update();
    eb.decay--;
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
  controlsShoot();

  if (dashReset == 60) {
    dashTimer = 0;
  }

  if (dashReset != 60) {
    dashReset++;
  }
  
  if (healTimer > 60 && heal == true) {
    lives++;
    healTimer = 0;
    heal = false;
  }
  
  if(lives > maxLives){
    lives = maxLives;
  }

  
  
  
  if(pressed[76] && temp > 60){
    enemySpawn();
    temp=0;
  }
  
  healthBar();
  
  
  healTimer++;
  shootTimer++;
  hitTimer++;
  temp++;
  canHit++;
  println(lives);
  
  fx.render()
    .bloom(0.0001, 20, 40)
    .pixelate(300)
    .compose();
    
}
